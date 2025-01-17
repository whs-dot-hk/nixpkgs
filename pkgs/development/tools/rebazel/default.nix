{
  lib,
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  CoreServices,
}:

rustPlatform.buildRustPackage rec {
  pname = "rebazel";
  version = "0.1.4";

  src = fetchFromGitHub {
    owner = "meetup";
    repo = "rebazel";
    rev = "v${version}";
    hash = "sha256-v84ZXhtJpejQmP61NmP06+qrtMu/0yb7UyD7U12xlME=";
  };

  cargoHash = "sha256-cBAm8LyNKEVJkhZJ+QZU5XtQutb1oNvad8xH70Bi2LM=";

  buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ CoreServices ];

  meta = with lib; {
    description = "tool for expediting bazel build workflows";
    mainProgram = "rebazel";
    homepage = "https://github.com/meetup/rebazel";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };
}
