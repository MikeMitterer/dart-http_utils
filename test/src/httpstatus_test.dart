part of test;

testHTTPStatus() {

  group('HTTP Status', () {

    test('> Check OK Status', () {
      expect(200,HttpStatus.HTTP_200_OK);
      expect(200,HttpStatus.HTTP_OK);
      });
  });
}

//------------------------------------------------------------------------------------------------
// Helper
//------------------------------------------------------------------------------------------------


