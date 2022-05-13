enum SplashStatus { loading, done }

class SplashModelState {
  SplashModelState({
    this.splashStatus = SplashStatus.loading,
  });

  final SplashStatus splashStatus;

  SplashModelState copyWith({
    SplashStatus? splashStatus,
  }) {
    return SplashModelState(
      splashStatus: splashStatus ?? this.splashStatus,
    );
  }

  @override
  String toString() => 'SplashState(splashStatus: $splashStatus)';
}
