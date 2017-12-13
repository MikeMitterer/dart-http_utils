import 'package:grinder/grinder.dart';

main(final List<String> args) => grind(args);

@Task()
@Depends(analyze, testUnit)
test() {
}

@Task()
testUnit() {
    new TestRunner().testAsync(files: "test");
    // new TestRunner().testAsync(files: "test",platformSelector: "content-shell");
}

@Task()
analyze() {
    final List<String> libs = [
        "lib/http_utils.dart"
    ];

    libs.forEach((final String lib) => Analyzer.analyze(lib));
    Analyzer.analyze("test");
}

//@DefaultTask()
//@Depends(test)
//build() => Pub.build();

@Task()
clean() => defaultClean();
