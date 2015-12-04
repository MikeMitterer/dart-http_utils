import 'dart:core';

import 'package:test/test.dart';

import 'package:http_utils/http_utils.dart';
import 'package:intl/intl.dart';

main() {
    final String dateIso8601 = "2013-12-04T12:01:33+01:00";
    final List<String> date822 = ["Wed, 02 Oct 2002 08:00:00 EST", "Wed, 02 Oct 2002 13:00:00 GMT", "Wed, 02 Oct 2002 15:00:00 +0200", "Wed, 02 Oct 2002 15:00:00 +0230"];

    final DateUtils du = new DateUtils();

    group('DateUtils', () {

        test('> testParseIso8601Date', () {
            expect(du.parseIso8601Date(dateIso8601).year, 2013);
            expect(du.parseIso8601Date(dateIso8601).hour, 12);
            expect(du.parseIso8601Date(dateIso8601).timeZoneOffset.inHours, 1);
        }); // end of 'testParseIso8601Date' test

        test('> testFormatIso8601Date', () {
             // final DateTime dt = du.parseIso8601Date(dateIso8601);
             // expect(du.formatIso8601Date(dt),dateIso8601);

            // Produziert:
            // DateUtils > testFormatIso8601Date. Test failed: Caught UnimplementedError
            // package:intl/src/date_format_field.dart 418:5     _DateFormatPatternField.formatTimeZoneRFC
            // package:intl/src/date_format_field.dart 178:41    _DateFormatPatternField.formatField
            // package:intl/src/date_format_field.dart 112:25    _DateFormatPatternField.format

        },skip: "Fraglich ob die Implementierung notwendig ist - eigentlich nicht..."); // end of 'testFormatIso8601Date' test

        test('> testParseRfc822Date', () {
            expect(du.parseRfc822Date(date822[0]).year, 2002);

            expect(du.parseRfc822Date(date822[0]).month, 10);
            expect(du.parseRfc822Date(date822[0]).hour, 8);

            expect(du.parseRfc822Date(date822[1]).year, 2002);
            expect(du.parseRfc822Date(date822[1]).month, 10);
            expect(du.parseRfc822Date(date822[1]).hour, 13);

            expect(du.parseRfc822Date(date822[2]).year, 2002);
            expect(du.parseRfc822Date(date822[2]).month, 10);
            expect(du.parseRfc822Date(date822[2]).hour, 15);
            expect(du.parseRfc822Date(date822[2]).timeZoneOffset.inHours, 2);

            expect(du.parseRfc822Date(date822[3]).timeZoneOffset.inHours, 2);

            // final DateTime dt = DateTime.parse(date822[3]);
            // expect(dt.timeZoneOffset.inMinutes, 150); - Fails!!!
            // Issue: https://code.google.com/p/dart/issues/detail?id=16801
            // expect(du.parseRfc822Date(date822[3]).timeZoneOffset.inMinutes, 150);

        }); // end of 'testParseRfc822Date' test

        // Issue: https://code.google.com/p/dart/issues/detail?id=16801
        // + https://github.com/dart-lang/intl/issues/34
        // DateFormat cannot parse time zones!
        test('> parseForIssueReport', () {
             final DateFormat rfc822Formatter = new DateFormat("EEE, dd MMM yyyy HH:mm:ss Z","en_US");
             final DateTime dt = rfc822Formatter.parse("Wed, 02 Oct 2002 15:00:00 +0230");

             expect(dt.timeZoneOffset.inMinutes, 150);
         }, skip: "DateFormat cannot parse time zones!"); // end of 'parseForIssueReport' test

        test('> formatRfc822Date', () {
            final DateTime dt = du.parseRfc822Date(date822[2]);
            expect(dt, isNotNull);

            expect(dt.timeZoneOffset.inMinutes,120);
            expect(du.formatRfc822Date(dt), date822[2]);

        });
        // end of 'formatRfc822Date' test

    });
    // end 'DateUtils' group
}
