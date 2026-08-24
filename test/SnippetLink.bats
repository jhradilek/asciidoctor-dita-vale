load test_helper

@test "Ignore links in other module types" {
  run run_vale "$BATS_TEST_FILENAME" ignore_other_modules.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore links in code blocks" {
  run run_vale "$BATS_TEST_FILENAME" ignore_code_blocks.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore escaped links" {
  run run_vale "$BATS_TEST_FILENAME" ignore_escaped_links.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Ignore files withe the IGNORE content type" {
  run run_vale "$BATS_TEST_FILENAME" ignore_ignored_files.adoc
  [ "$status" -eq 0 ]
  [ "${lines[0]}" = "" ]
}

@test "Report all link variations outside of additional resources" {
  run run_vale "$BATS_TEST_FILENAME" report_invalid_links.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 25 ]
  [ "${lines[0]}" = "report_invalid_links.adoc:4:3:AsciiDocDITA.SnippetLink:link:/absolute/path/to/file.ext[]" ]
  [ "${lines[1]}" = "report_invalid_links.adoc:5:3:AsciiDocDITA.SnippetLink:link:/absolute/path/to/file.ext#anchor[link text]" ]
  [ "${lines[2]}" = "report_invalid_links.adoc:6:3:AsciiDocDITA.SnippetLink:link:https://example.com" ]
  [ "${lines[3]}" = "report_invalid_links.adoc:7:3:AsciiDocDITA.SnippetLink:link:https://example.com" ]
  [ "${lines[4]}" = "report_invalid_links.adoc:8:3:AsciiDocDITA.SnippetLink:https://example.com" ]
  [ "${lines[5]}" = "report_invalid_links.adoc:9:3:AsciiDocDITA.SnippetLink:https://example.com/page.html" ]
  [ "${lines[6]}" = "report_invalid_links.adoc:10:3:AsciiDocDITA.SnippetLink:https://example.com/page.html#anchor" ]
  [ "${lines[7]}" = "report_invalid_links.adoc:11:3:AsciiDocDITA.SnippetLink:https://example.com" ]
  [ "${lines[8]}" = "report_invalid_links.adoc:12:3:AsciiDocDITA.SnippetLink:https://example.com/page.html" ]
  [ "${lines[9]}" = "report_invalid_links.adoc:13:3:AsciiDocDITA.SnippetLink:https://example.com/page.html#anchor" ]
  [ "${lines[10]}" = "report_invalid_links.adoc:14:4:AsciiDocDITA.SnippetLink:https://example.com/_" ]
  [ "${lines[11]}" = "report_invalid_links.adoc:15:4:AsciiDocDITA.SnippetLink:https://example.com/*" ]
  [ "${lines[12]}" = "report_invalid_links.adoc:16:4:AsciiDocDITA.SnippetLink:https://example.com/\`" ]
  [ "${lines[13]}" = "report_invalid_links.adoc:17:4:AsciiDocDITA.SnippetLink:https://example.com/#" ]
  [ "${lines[14]}" = "report_invalid_links.adoc:18:4:AsciiDocDITA.SnippetLink:https://example.com/~" ]
  [ "${lines[15]}" = "report_invalid_links.adoc:19:4:AsciiDocDITA.SnippetLink:https://example.com/^" ]
  [ "${lines[16]}" = "report_invalid_links.adoc:20:4:AsciiDocDITA.SnippetLink:https://example.com)" ]
  [ "${lines[17]}" = "report_invalid_links.adoc:21:4:AsciiDocDITA.SnippetLink:https://example.com" ]
  [ "${lines[18]}" = "report_invalid_links.adoc:22:3:AsciiDocDITA.SnippetLink:<https://example.com>" ]
  [ "${lines[19]}" = "report_invalid_links.adoc:23:3:AsciiDocDITA.SnippetLink:xref:reference-link[link text]" ]
  [ "${lines[20]}" = "report_invalid_links.adoc:24:3:AsciiDocDITA.SnippetLink:xref:reference-link#anchor[link text]" ]
  [ "${lines[21]}" = "report_invalid_links.adoc:25:3:AsciiDocDITA.SnippetLink:xref:file-name.ext[link text]" ]
  [ "${lines[22]}" = "report_invalid_links.adoc:26:3:AsciiDocDITA.SnippetLink:xref:file-name.ext#anchor[link text]" ]
  [ "${lines[23]}" = "report_invalid_links.adoc:27:3:AsciiDocDITA.SnippetLink:<<anchor>>" ]
  [ "${lines[24]}" = "report_invalid_links.adoc:28:3:AsciiDocDITA.SnippetLink:<<anchor,link text>>" ]
}

@test "Report links with attribute references" {
  run run_vale "$BATS_TEST_FILENAME" report_attribute_references.adoc
  [ "$status" -eq 0 ]
  [ "${#lines[@]}" -eq 23 ]
  [ "${lines[0]}" = "report_attribute_references.adoc:4:3:AsciiDocDITA.SnippetLink:link:{DOCUMENT_URL}[link text]" ]
  [ "${lines[1]}" = "report_attribute_references.adoc:5:3:AsciiDocDITA.SnippetLink:link:++{DOCUMENT_URL}++[link text]" ]
  [ "${lines[2]}" = "report_attribute_references.adoc:6:3:AsciiDocDITA.SnippetLink:link:https://{DOCUMENT_URL}" ]
  [ "${lines[3]}" = "report_attribute_references.adoc:7:3:AsciiDocDITA.SnippetLink:link:{BaseURL}/docs/version-{ProductVersion}/title[link text]" ]
  [ "${lines[4]}" = "report_attribute_references.adoc:8:3:AsciiDocDITA.SnippetLink:https://{DOCUMENT_URL}" ]
  [ "${lines[5]}" = "report_attribute_references.adoc:9:3:AsciiDocDITA.SnippetLink:https://{DomainName}.com" ]
  [ "${lines[6]}" = "report_attribute_references.adoc:10:3:AsciiDocDITA.SnippetLink:https://example.com/{UrlFragment}" ]
  [ "${lines[7]}" = "report_attribute_references.adoc:11:3:AsciiDocDITA.SnippetLink:http://{DOCUMENT_URL}" ]
  [ "${lines[8]}" = "report_attribute_references.adoc:12:3:AsciiDocDITA.SnippetLink:file://{DOCUMENT_URL}" ]
  [ "${lines[9]}" = "report_attribute_references.adoc:13:3:AsciiDocDITA.SnippetLink:ftp://{DOCUMENT_URL}" ]
  [ "${lines[10]}" = "report_attribute_references.adoc:14:3:AsciiDocDITA.SnippetLink:irc://{DOCUMENT_URL}" ]
  [ "${lines[11]}" = "report_attribute_references.adoc:15:3:AsciiDocDITA.SnippetLink:mailto:{EmailAddress}[]" ]
  [ "${lines[12]}" = "report_attribute_references.adoc:16:3:AsciiDocDITA.SnippetLink:mailto:{UserName}@example.com[]" ]
  [ "${lines[13]}" = "report_attribute_references.adoc:17:3:AsciiDocDITA.SnippetLink:mailto:admin@{DomainName}[]" ]
  [ "${lines[14]}" = "report_attribute_references.adoc:18:3:AsciiDocDITA.SnippetLink:<ftp://{SERVER_NAME}/downloads/>" ]
  [ "${lines[15]}" = "report_attribute_references.adoc:19:3:AsciiDocDITA.SnippetLink:https://{ProductURL}" ]
  [ "${lines[16]}" = "report_attribute_references.adoc:20:3:AsciiDocDITA.SnippetLink:xref:{AnchorFragment}[]" ]
  [ "${lines[17]}" = "report_attribute_references.adoc:21:3:AsciiDocDITA.SnippetLink:xref:{AnchorFragment}-suffix[]" ]
  [ "${lines[18]}" = "report_attribute_references.adoc:22:3:AsciiDocDITA.SnippetLink:xref:prefix-{AnchorFragment}[link text]" ]
  [ "${lines[19]}" = "report_attribute_references.adoc:23:3:AsciiDocDITA.SnippetLink:<<{AnchorFragment}>>" ]
  [ "${lines[20]}" = "report_attribute_references.adoc:24:3:AsciiDocDITA.SnippetLink:<<{AnchorFragment}-suffix>>" ]
  [ "${lines[21]}" = "report_attribute_references.adoc:25:3:AsciiDocDITA.SnippetLink:<<prefix-{AnchorFragment}>>" ]
  [ "${lines[22]}" = "report_attribute_references.adoc:26:3:AsciiDocDITA.SnippetLink:<<{AnchorFragment},link text>>" ]
}
