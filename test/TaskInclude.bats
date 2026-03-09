load test_helper

@test "Ignore valid include directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_includes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report potentially problematic include directives" {
  run run_vale "$BATS_TEST_FILENAME" report_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_includes.adoc:6:1:AsciiDocDITA.TaskInclude:The included file may introduce content that cannot be mapped to DITA steps." ]
  [ "${lines[1]}" = "report_includes.adoc:10:1:AsciiDocDITA.TaskInclude:The included file may introduce content that cannot be mapped to DITA steps." ]
  [ "${lines[2]}" = "report_includes.adoc:14:1:AsciiDocDITA.TaskInclude:The included file may introduce content that cannot be mapped to DITA steps." ]
}
