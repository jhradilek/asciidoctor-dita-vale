load test_helper

@test "Ignore files with [role=\"_abstract\"]" {
  run run_vale "$BATS_TEST_FILENAME" ignore_double_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with [role='_abstract']" {
  run run_vale "$BATS_TEST_FILENAME" ignore_single_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files with [role=_abstract]" {
  run run_vale "$BATS_TEST_FILENAME" ignore_no_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files with [role=“_abstract”] or [role=‘_abstract’]" {
  run run_vale "$BATS_TEST_FILENAME" report_curly_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_curly_quotes.adoc:2:1:AsciiDocDITA.ShortDescription:Assign [role=\"\_abstract\"] to the first paragraph in a concept, procedure, or reference module to use it as <shortdesc> in DITA." ]
}

@test "Report files with [role=\"_abstract'] or [role='_abstract]" {
  run run_vale "$BATS_TEST_FILENAME" report_mismatched_quotes.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_mismatched_quotes.adoc:2:1:AsciiDocDITA.ShortDescription:Assign [role=\"\_abstract\"] to the first paragraph in a concept, procedure, or reference module to use it as <shortdesc> in DITA." ]
}

@test "Report files with abstract in line comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:4:1:AsciiDocDITA.ShortDescription:Assign [role=\"\_abstract\"] to the first paragraph in a concept, procedure, or reference module to use it as <shortdesc> in DITA." ]
}

@test "Report files with no abstracts" {
  run run_vale "$BATS_TEST_FILENAME" report_missing_abstract.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_missing_abstract.adoc:3:1:AsciiDocDITA.ShortDescription:Assign [role=\"\_abstract\"] to the first paragraph in a concept, procedure, or reference module to use it as <shortdesc> in DITA." ]
}

@test "Ignore SNIPPET content type without [role=\"_abstract\"]" {
  run run_vale "$BATS_TEST_FILENAME" ignore_snippet.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore ASSEMBLY content type without [role=\"_abstract\"]" {
  run run_vale "$BATS_TEST_FILENAME" ignore_assembly.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report files without content type" {
  run run_vale "$BATS_TEST_FILENAME" report_no_content_type.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_no_content_type.adoc:2:1:AsciiDocDITA.ShortDescription:Assign [role=\"\_abstract\"] to the first paragraph in a concept, procedure, or reference module to use it as <shortdesc> in DITA." ]
}
