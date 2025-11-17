load test_helper

@test "Ignore attribute declarations" {
  run run_vale "$BATS_TEST_FILENAME" ignore_attributes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore include directives" {
  run run_vale "$BATS_TEST_FILENAME" ignore_includes.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore author lines inside of block comments" {
  run run_vale "$BATS_TEST_FILENAME" ignore_comments.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore documents without author lines" {
  run run_vale "$BATS_TEST_FILENAME" ignore_empty_line.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore level 1 sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_subsections.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore subsequent level 0 sections" {
  run run_vale "$BATS_TEST_FILENAME" ignore_second_title.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report author lines only once" {
  run run_vale "$BATS_TEST_FILENAME" report_author_line.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_author_line.adoc:3:1:AsciiDocDITA.AuthorLine:Author lines are not supported for topics." ]
}

@test "Report author lines separated by comments" {
  run run_vale "$BATS_TEST_FILENAME" report_comments.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 1 ]
  [ "${lines[0]}" = "report_comments.adoc:7:1:AsciiDocDITA.AuthorLine:Author lines are not supported for topics." ]
}
