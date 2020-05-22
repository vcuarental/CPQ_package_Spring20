global class Utils_Product2PB2PBE {
    public static PricebookEntry createPricebookEntry (Pricebook2 standard, Product2 prod) {
        System.debug('***** starting one');
        PricebookEntry one = new PricebookEntry();
        one.pricebook2Id = standard.id;
        one.product2id = prod.id;
        one.unitprice = 1249.0;
        one.isactive = true;
        insert one;
        System.debug('***** one complete, ret next');
        return one;
    }
}