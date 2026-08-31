load test_helper

@test "Ignore content inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_map.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc assemblies" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_assembly.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report includes with invalid leveloffset values in maps" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:9:1:AsciiDocDITA.MapLevel:Invalid leveloffset value." ]
  [ "${lines[1]}" = "report_invalid_lines.adoc:11:1:AsciiDocDITA.MapLevel:Invalid leveloffset value." ]
}

@test "Report includes with invalid leveloffset values in assemblies" {
  run run_vale "$BATS_TEST_FILENAME" report_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 2 ]
  [ "${lines[0]}" = "report_assembly_includes.adoc:12:1:AsciiDocDITA.MapLevel:Invalid leveloffset value." ]
  [ "${lines[1]}" = "report_assembly_includes.adoc:14:1:AsciiDocDITA.MapLevel:Invalid leveloffset value." ]
}
