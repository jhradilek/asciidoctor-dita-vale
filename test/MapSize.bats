load test_helper

@test "Ignore include directives inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore supported attribute includes" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attribute_includes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore valid AsciiDoc maps" {
  run run_vale "$BATS_TEST_FILENAME" ignore_valid_map.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report maps with more than 200 include directives" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_lines.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_invalid_lines.adoc:204:1:AsciiDocDITA.MapSize:The number of include directives exceeds 200." ]
}

@test "Report assemblies with more than 199 include directives" {
  run run_vale "$BATS_TEST_FILENAME" report_assembly_includes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_assembly_includes.adoc:209:1:AsciiDocDITA.MapSize:The number of include directives exceeds 200." ]
}
