load test_helper

@test "Ignore files with any other content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_legitimate_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" report_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_ignored_files.adoc:2:1:AsciiDocDITA.IgnoredFile::_mod-docs-content-type: IGNORE" ]
}
