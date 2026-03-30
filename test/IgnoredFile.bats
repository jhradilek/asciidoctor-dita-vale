load test_helper

@test "Report conditional directive variations" {
  run run_vale "$BATS_TEST_FILENAME" report_ignored_file.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_ignored_file.adoc:2:1:AsciiDocDITA.IgnoredFile::_mod-docs-content-type: IGNORE" ]
}
