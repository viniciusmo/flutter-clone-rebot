import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/mockito.dart';
import 'package:rebot/login/repository/access_token.dart';
import 'package:rebot/login/repository/user_repository.dart';
import 'package:rebot/login/state/login.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  LoginBloc loginBloc;
  MockUserRepository userRepository;

  setUp(() {
    userRepository = MockUserRepository();
    loginBloc = LoginBloc(
      userRepository: userRepository,
    );
  });

  tearDown(() {
    loginBloc?.close();
  });

  test('throws AssertionError when userRepository is null', () {
    expect(
      () => LoginBloc(
        userRepository: null,
      ),
      throwsAssertionError,
    );
  });

  test('initial state is correct', () {
    expect(LoginInitial(), loginBloc.initialState);
  });

  test('close does not emit new states', () {
    expectLater(
      loginBloc,
      emitsInOrder([LoginInitial(), emitsDone]),
    );
    loginBloc.close();
  });

  group('LogiRequested', () {
    blocTest('emits [LoginLoading, LoginSuccess] and token on success',
        build: () async {
          when(userRepository.authenticate(
            username: 'valid.username',
            password: 'valid.password',
          )).thenAnswer((_) => Future.value(AccessToken()));
          return loginBloc;
        },
        act: (bloc) => bloc.add(
              LoginRequested(
                username: 'valid.username',
                password: 'valid.password',
              ),
            ),
        expect: [LoginLoading(), LoginSuccess()]);

    blocTest('emits [LoginLoading, LoginFailure] and login failure',
        build: () async {
          when(userRepository.authenticate(
            username: 'invalid.username',
            password: 'invalid.password',
          )).thenAnswer((_) => Future.error("Login failure"));
          return loginBloc;
        },
        act: (bloc) => bloc.add(
              LoginRequested(
                username: 'invalid.username',
                password: 'invalid.password',
              ),
            ),
        expect: [LoginLoading(), LoginFailure(error: "Login failure")]);
  });
}
