part of httputils;

/**
 * Created by mikemitterer on 04.12.13.
 */
class DateUtils {

    /**
     * ISO 8601 format
     */
    final DateFormat iso8601Formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ssZ","en_US");

    /**
     * RFC 822 format
     * Z    = Wed, 02 Oct 2002 13:00:00 +0000
     * ZZ   = Wed, 02 Oct 2002 13:00:00 +00:00
     * ZZZ  = Wed, 02 Oct 2002 13:00:00 Etc/GMT
     * z    = Wed, 02 Oct 2002 13:00:00 +00:00
     * zz   = Wed, 02 Oct 2002 13:00:00 +00:00
     * zzz  = Wed, 02 Oct 2002 13:00:00 +00:00
     */
    final DateFormat rfc822PatternWithoutTZ = new DateFormat("EEE, dd MMM yyyy HH:mm:ss","en_US");
    final DateFormat rfc822Formatter   = new DateFormat("EEE, dd MMM yyyy HH:mm:ss Z","en_US");

    /**
     * Constructs a new DateUtils object, ready to parse/format dates.
     */
    DateUtils() {
    }

    DateTime parseIso8601Date(String dateString) {
        return iso8601Formatter.parse(dateString);
    }

    /*
     * Formats the specified date as an ISO 8601 string.
     *
     * @param date The date to format.
     * @return The ISO 8601 string representing the specified date.
     *
     * Produziert:
     * DateUtils > testFormatIso8601Date. Test failed: Caught UnimplementedError
     * package:intl/src/date_format_field.dart 418:5     _DateFormatPatternField.formatTimeZoneRFC
     * package:intl/src/date_format_field.dart 178:41    _DateFormatPatternField.formatField
     * package:intl/src/date_format_field.dart 112:25    _DateFormatPatternField.format
     */
     // String formatIso8601Date(DateTime date) {
     //    return iso8601Formatter.format(date);
     //}

    /**
     * Parses the specified date string as an RFC 822 date and returns the Date
     * object.
     *
     *
     * @param dateString The date string to parse.
     * @return The parsed Date object.
     * @throws ParseException If the date string could not be parsed.
     */
    DateTime parseRfc822Date(final String dateString) {
        return rfc822Formatter.parse(dateString);
    }

    /**
     * Formats the specified date as an RFC 822 string.
     *
     * @param date The date to format.
     * @return The RFC 822 string representing the specified date.
     */
    String formatRfc822Date(DateTime date) {
        final String withoutTZ = rfc822PatternWithoutTZ.format(date);
        final Duration duration = date.timeZoneOffset;

        String twoDigits(final int n) {
            if (n >= 10) return "${n}";
            return "0${n}";
        }

        String twoDigitsWithSign(final int n) {
            if (n >= 10) return "+${n}";
            else if(n >= 0) return "+0${n}";
            else if(n > -10) return "-0${n}";
            else return "-${n}";
        }

        final String h = twoDigitsWithSign(duration.inHours);
        final String m = twoDigits(duration.inHours * 60 - duration.inMinutes);

        return "$withoutTZ $h$m";
    }
}