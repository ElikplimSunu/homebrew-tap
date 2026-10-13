class Tdtm < Formula
  desc "Microsoft TMT-style STRIDE threat generation for data-flow diagrams"
  homepage "https://github.com/ElikplimSunu/tdtm"
  url "https://github.com/ElikplimSunu/tdtm/releases/download/v0.3.0/tdtm-0.3.0.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "python@3.13"

  def install
    # ponytail: tdtm needs only the Python standard library, so no virtualenv
    libexec.install "src/tdtm"
    (bin/"tdtm").write <<~SH
      #!/bin/bash
      PYTHONPATH="#{libexec}" exec "#{Formula["python@3.13"].opt_bin}/python3.13" -m tdtm "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tdtm --version")
    assert_match "Web Application", shell_output("#{bin}/tdtm stencils --kind process")
  end
end
