load test_helper

@test "Ignore cross references that use similar markup" {
  run run_vale "$BATS_TEST_FILENAME" ignore_cross_references.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore XML code blocks taht use similar markup" {
  run run_vale "$BATS_TEST_FILENAME" ignore_xml_markup.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report unsupported callout list variations" {
  run run_vale "$BATS_TEST_FILENAME" report_callout_lists.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 3 ]
  [ "${lines[0]}" = "report_callout_lists.adoc:7:1:AsciiDocDITA.CalloutList:Callouts are not supported in DITA." ]
  [ "${lines[1]}" = "report_callout_lists.adoc:13:1:AsciiDocDITA.CalloutList:Callouts are not supported in DITA." ]
  [ "${lines[2]}" = "report_callout_lists.adoc:18:1:AsciiDocDITA.CalloutList:Callouts are not supported in DITA." ]
}
