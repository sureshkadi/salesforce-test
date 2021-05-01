@isTest
private class Calculate {

    @isTest
    private static void testSum(){
        Integer a,b,c;
        a=3;b=4;
        c = a * b;
        system.assertEquals(7, c);
    }
}