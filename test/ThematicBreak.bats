load test_helper

@test "Ignore thematic breaks inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore thematic breaks in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore document separators in YAML files" {
  run run_vale "$BATS_TEST_FILENAME" ignore_yaml_separators.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid thematic break variations" {
  run run_vale "$BATS_TEST_FILENAME" report_thematic_break.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 7 ]
  [ "${lines[0]}" = "report_thematic_break.adoc:5:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[1]}" = "report_thematic_break.adoc:9:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[2]}" = "report_thematic_break.adoc:13:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[3]}" = "report_thematic_break.adoc:17:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[4]}" = "report_thematic_break.adoc:21:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[5]}" = "report_thematic_break.adoc:25:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
  [ "${lines[6]}" = "report_thematic_break.adoc:29:1:AsciiDocDITA.ThematicBreak:Thematic breaks are not supported in DITA." ]
}
