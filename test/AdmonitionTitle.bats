load test_helper

@test "Ignore admonition titles inside of line and block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore steps that have similar syntax to admonition titles" {
  run run_vale "$BATS_TEST_FILENAME" ignore_steps.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignore_type.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report admonition title variations" {
  run run_vale "$BATS_TEST_FILENAME" report_admonition_title.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 16 ]
  [ "${lines[0]}" = "report_admonition_title.adoc:2:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[1]}" = "report_admonition_title.adoc:8:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[2]}" = "report_admonition_title.adoc:14:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[3]}" = "report_admonition_title.adoc:20:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[4]}" = "report_admonition_title.adoc:26:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[5]}" = "report_admonition_title.adoc:33:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[6]}" = "report_admonition_title.adoc:36:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[7]}" = "report_admonition_title.adoc:39:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[8]}" = "report_admonition_title.adoc:42:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[9]}" = "report_admonition_title.adoc:45:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[10]}" = "report_admonition_title.adoc:50:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[11]}" = "report_admonition_title.adoc:56:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[12]}" = "report_admonition_title.adoc:67:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[13]}" = "report_admonition_title.adoc:76:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[14]}" = "report_admonition_title.adoc:83:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
  [ "${lines[15]}" = "report_admonition_title.adoc:88:1:AsciiDocDITA.AdmonitionTitle:Admonition titles are not supported in DITA." ]
}
