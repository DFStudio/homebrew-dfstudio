class DynamodbDaemon < Formula
  desc "Locally-hosted DynamoDB server"
  homepage "https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/DynamoDBLocal.html"
  #url "https://d1ni2b6xgvw0s0.cloudfront.net/v2.x/dynamodb_local_latest.tar.gz"
  url "https://raw.githubusercontent.com/DFStudio/homebrew-dfstudio/artifacts/dynamodb-daemon/dynamodb_local_2.5.4.tar.gz"
  version "2.5.4"
  revision 4
  sha256 "60b1561fa6141642dbd3ad9ab75a6315c94877f6f42e60551125b11ea8a62c97"
  #license ""

  depends_on "openjdk@17"

  def install
    libexec.install "DynamoDBLocal_lib"
    libexec.install "DynamoDBLocal.jar"

    (bin/"dynamodb-local").write <<~EOS
      #!/bin/bash
      export JAVA_HOME="#{Language::Java.overridable_java_home_env("17")[:JAVA_HOME]}"
      exec "${JAVA_HOME}/bin/java" -Djava.library.path='#{libexec}/DynamoDBLocal_lib' -jar '#{libexec}/DynamoDBLocal.jar' "$@"
    EOS
  end

  def post_install
    (var/"log").mkpath
    dynamodb_db_path.mkpath
  end

  def dynamodb_run_path
    var/name
  end

  def dynamodb_db_path
    dynamodb_run_path/"data"
  end

  def dynamodb_log_path
    var/"log/#{name}.log"
  end

  service do
    run [bin/"dynamodb-local", "-port", "8800", "-dbPath", f.dynamodb_db_path, "-cors", "https://dynamodb-manager.netlify.app"]
    keep_alive true
    log_path f.dynamodb_log_path
    error_log_path f.dynamodb_log_path
    working_dir f.dynamodb_run_path
  end
end
