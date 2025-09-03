load test_helper

@test "Ignore sidebars inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore sidebars inside of code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore thematic breaks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_thematic_breaks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report valid sidebar variations" {
  run run_vale "$BATS_TEST_FILENAME" report_sidebar.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 5 ]
  [ "${lines[0]}" = "report_sidebar.adoc:2:1:AsciiDocDITA.SidebarBlock:Sidebars are not supported in DITA." ]
  [ "${lines[1]}" = "report_sidebar.adoc:6:1:AsciiDocDITA.SidebarBlock:Sidebars are not supported in DITA." ]
  [ "${lines[2]}" = "report_sidebar.adoc:8:1:AsciiDocDITA.SidebarBlock:Sidebars are not supported in DITA." ]
  [ "${lines[3]}" = "report_sidebar.adoc:11:1:AsciiDocDITA.SidebarBlock:Sidebars are not supported in DITA." ]
  [ "${lines[4]}" = "report_sidebar.adoc:13:1:AsciiDocDITA.SidebarBlock:Sidebars are not supported in DITA." ]
}
