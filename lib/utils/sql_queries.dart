class SqlQueries {
  static const String createAssetTable = '''
CREATE TABLE IF NOT EXISTS Asset (
  assetId INTEGER PRIMARY KEY,
  outletId INTEGER,
  organizationId INTEGER,
  assetTypeMainId INTEGER,
  longitude REAL,
  latitude REAL,
  assetModel TEXT,
  assetModelId INTEGER,
  assetName TEXT,
  assetNumber TEXT,
  assetType TEXT,
  assetTypeId INTEGER,
  assignedDate INTEGER,
  assignmentCode TEXT,
  cost REAL,
  deposit REAL,
  documentNumber TEXT,
  statusid INTEGER,
  expiryDate INTEGER,
  returnDate INTEGER,
  barcode TEXT,
  transactionType TEXT,
  reason TEXT,
  verified INTEGER
);
''';

  static const String createAvailableStockTable = '''
CREATE TABLE IF NOT EXISTS AvailableStock (
  pk_modid INTEGER PRIMARY KEY AUTOINCREMENT,
  productId INTEGER,
  packageId INTEGER,
  unitProductDefinitionId INTEGER,
  cartonProductDefinitionId INTEGER,
  orderId INTEGER,
  outletId INTEGER,
  cartonQuantity INTEGER ,
  unitQuantity INTEGER
);
''';

  static const String createCartonPriceBreakDownTable = '''
CREATE TABLE IF NOT EXISTS CartonPriceBreakDown (
  pk_cpbd INTEGER PRIMARY KEY AUTOINCREMENT,
  fk_modid INTEGER NOT NULL,
  orderId INTEGER,
  priceCondition TEXT,
  priceConditionType TEXT,
  priceConditionClass TEXT,
  priceConditionClassOrder INTEGER,
  priceConditionId INTEGER,
  priceConditionDetailId INTEGER,
  accessSequence TEXT,
  unitPrice REAL,
  blockPrice REAL,
  totalPrice REAL,
  calculationType INTEGER,
  outletId INTEGER,
  productId INTEGER,
  productDefinitionId INTEGER,
  isMaxLimitReached INTEGER,
  maximumLimit REAL,
  alreadyAvailed REAL,
  limitBy INTEGER,
  FOREIGN KEY (fk_modid) REFERENCES OrderDetail (pk_modid) ON DELETE CASCADE
);
 CREATE INDEX idx_cartonPriceBreakdownTable_mobileOrderId ON CartonPriceBreakDown (fk_modid);
''';

  static const String createCustomerInputTable = '''
CREATE TABLE IF NOT EXISTS CustomerInput (
  outletId INTEGER NOT NULL,
  orderId INTEGER NOT NULL,
  mobileNumber TEXT,
  strn TEXT,
  remarks TEXT,
  signature TEXT,
  cnic TEXT,
  deliveryDate INTEGER NOT NULL,
  PRIMARY KEY (outletId, orderId)
);
''';

  static const String createMarketReturnReasonTable = '''
CREATE TABLE IF NOT EXISTS MarketReturnReason (
  id INTEGER PRIMARY KEY,
  marketReturnReason TEXT,
  returnedProductTypeId INTEGER
);
''';

  static const String createLookUpTable = '''
CREATE TABLE IF NOT EXISTS LookUp (
  lookUpId INTEGER PRIMARY KEY AUTOINCREMENT,
  assetStatus TEXT, 
  marketReturnReasons TEXT
);
''';

  static const String createMarketReturnDetailsTable = '''
CREATE TABLE IF NOT EXISTS MarketReturnDetails (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  outletId INTEGER,
  productId INTEGER,
  unitDefinitionId INTEGER,
  cartonDefinitionId INTEGER,
  replacementProductId INTEGER,
  replacementUnitDefinitionId INTEGER,
  replacementCartonDefinitionId INTEGER,
  marketReturnReasonId INTEGER,
  invoiceId INTEGER,
  cartonQuantity INTEGER,
  unitQuantity INTEGER,
  replaceWith TEXT,
  replacementCartonQuantity INTEGER,
  replacementUnitQuantity INTEGER,
  cartonSize INTEGER,
  replacementCartonSize INTEGER
);
''';

  static const String createMarketReturnsTable = '''
CREATE TABLE IF NOT EXISTS MarketReturns (
  outletId INTEGER PRIMARY KEY NOT NULL,
  invoiceId INTEGER
);
''';

  static const String createMerchandiseTable = '''
CREATE TABLE IF NOT EXISTS Merchandise (
    outletId INTEGER PRIMARY KEY,
    remarks TEXT,
    merchandiseImages TEXT,
    assets TEXT
);
''';

  static const String createOrderTable = '''
CREATE TABLE IF NOT EXISTS 'Order' (
  pk_oid INTEGER PRIMARY KEY AUTOINCREMENT,
  c_outletId INTEGER,
  serverOrderId INTEGER,
  routeId INTEGER,
  code TEXT,
  orderStatusId INTEGER,
  visitDayId INTEGER,
  latitude REAL,
  longitude REAL,
  subtotal REAL,
  payable REAL,
  orderDate INTEGER,
  deliveryDate INTEGER,
  distributionId INTEGER,
  priceBreakDown TEXT,
  orderDetails TEXT,
  FOREIGN KEY (c_outletId) REFERENCES Outlet(mOutletId) ON DELETE CASCADE
);
CREATE INDEX idx_order_outletId ON 'Order' (c_outletId)
''';

  static const String createOrderDetailTable = '''
  CREATE TABLE IF NOT EXISTS OrderDetail (
    pk_modid INTEGER PRIMARY KEY AUTOINCREMENT,
    mProductId INTEGER,
    fk_oid INTEGER NOT NULL,
    orderId INTEGER,
    packageId INTEGER,
    unitOrderDetailId INTEGER,
    cartonOrderDetailId INTEGER,
    mProductGroupId INTEGER,
    unitFreeGoodGroupId INTEGER,
    cartonFreeGoodGroupId INTEGER,
    unitFreeGoodDetailId INTEGER,
    cartonFreeGoodDetailId INTEGER,
    unitFreeGoodExclusiveId INTEGER,
    cartonFreeGoodExclusiveId INTEGER,
    mProductName TEXT,
    mCartonQuantity INTEGER,
    mUnitQuantity INTEGER,
    avlUnitQuantity INTEGER,
    avlCartonQuantity INTEGER,
    productTempDefinitionId INTEGER,
    productTempQuantity INTEGER,
    unitDefinitionId INTEGER,
    cartonDefinitionId INTEGER,
    actualUnitStock INTEGER,
    actualCartonStock INTEGER,
    cartonSize INTEGER,
    mCartonCode TEXT,
    mUnitCode TEXT,
    unitPrice REAL,
    cartonPrice REAL,
    unitTotalPrice REAL,
    cartonTotalPrice REAL,
    total REAL,
    subtotal REAL,
    type TEXT,
    unitFreeQuantityTypeId INTEGER,
    cartonFreeQuantityTypeId INTEGER,
    unitFreeGoodQuantity INTEGER,
    cartonFreeGoodQuantity INTEGER,
    unitSelectedFreeGoodQuantity INTEGER,
    cartonSelectedFreeGoodQuantity INTEGER,
    parentId INTEGER,
    cartonPriceBreakDown TEXT,
    unitPriceBreakDown TEXT,
    cartonFreeGoods TEXT,
    unitFreeGoods TEXT,
    FOREIGN KEY (fk_oid) REFERENCES `Order`(pk_oid) ON DELETE CASCADE
);
  CREATE INDEX idx_order_detail_fk_oid ON OrderDetail (fk_oid);
  ''';

  static const String createUnitPriceBreakdownTable = '''
 CREATE TABLE IF NOT EXISTS UnitPriceBreakDown (
  pk_upbd INTEGER PRIMARY KEY AUTOINCREMENT,
  mOrderId INTEGER,
  fk_modid INTEGER,
  mPriceCondition TEXT,
  mPriceConditionType TEXT,
  mPriceConditionClass TEXT,
  mPriceConditionClassOrder INTEGER,
  mPriceConditionClassId INTEGER,
  mPriceConditionId INTEGER,
  mPriceConditionDetailId INTEGER,
  mAccessSequence TEXT,
  mUnitPrice REAL,
  mBlockPrice REAL,
  mTotalPrice REAL,
  mCalculationType INTEGER,
  outletId INTEGER,
  mProductId INTEGER,
  mProductDefinitionId INTEGER,
  isMaxLimitReached INTEGER,
  maximumLimit REAL,
  mAlreadyAvailed REAL,
  mLimitBy INTEGER,
  FOREIGN KEY (fk_modid) REFERENCES OrderDetail(pk_modid) ON DELETE CASCADE
);

  ''';

  static const String createOrderStatusTable = '''
  CREATE TABLE IF NOT EXISTS OrderStatus (
    outletId INTEGER PRIMARY KEY NOT NULL,
    orderId INTEGER,
    outletVisitEndTime INTEGER,
    outletVisitStartTime INTEGER,
    status INTEGER,
    orderAmount REAL,
    sync INTEGER,
    data TEXT,
    imageStatus INTEGER,
    requestStatus INTEGER DEFAULT 0,
    outletLatitude REAL,
    outletLongitude REAL,
    outletDistance INTEGER,
    FOREIGN KEY (outletId) REFERENCES Outlet(mOutletId) ON DELETE CASCADE
);
''';

  static const String createOutletTable = '''
  CREATE TABLE IF NOT EXISTS Outlet (
    mOutletId INTEGER PRIMARY KEY,
    mRouteId INTEGER,
    mOutletCode TEXT,
    mOutletName TEXT,
    mChannelName TEXT,
    mLocation TEXT,
    mVisitFrequency INTEGER,
    mVisitDay INTEGER,
    planned INTEGER,
    sequenceNumber INTEGER,
    mAddress TEXT,
    mLatitude REAL,
    mLongitude REAL,
    visitTimeLat REAL,
    visitTimeLng REAL,
    mLastSaleDate INTEGER,
    pricingGroupId INTEGER,
    vpoClassificationId INTEGER,
    channelId INTEGER,
    mLastSaleQuantity TEXT,
    mAvailableCreditLimit REAL,
    mOutstandingCredit REAL,
    mLastSale REAL,
    mVisitStatus INTEGER,
    cnic TEXT,
    strn TEXT,
    mtdSale REAL,
    mobileNumber TEXT,
    hasHTHDiscount INTEGER,
    hasRentalDiscount INTEGER,
    hasExclusivityFee INTEGER,
    lastOrder TEXT, -- Serialized as TEXT for simplicity
    isAssetsScennedInTheLastMonth INTEGER,
    synced INTEGER,
    statusId INTEGER,
    isZeroSaleOutlet INTEGER,
    promoTypeId INTEGER,
    customerRegistrationTypeId INTEGER,
    digitalAccount TEXT,
    disburseAmount REAL,
    remarks TEXT,
    organizationId INTEGER,
    outletPromoConfigId INTEGER,
    outletVisits TEXT, -- Serialized as TEXT for simplicity
    avlStockDetail TEXT -- Serialized as TEXT for simplicity
);
''';

  static const String createOutletAvailedPromotionTable = '''
CREATE TABLE IF NOT EXISTS OutletAvailedPromotion (
  id INTEGER PRIMARY KEY,
  outletId INTEGER,
  priceConditionId INTEGER,
  priceConditionDetailId INTEGER,
  quantity INTEGER,
  amount REAL,
  productId INTEGER,
  productDefinitionId INTEGER,
  packageId INTEGER
);
''';

  static const String createPackageTable = '''
  CREATE TABLE IF NOT EXISTS Package (
    packageId INTEGER PRIMARY KEY,
    packageName TEXT
);
''';

  static const String createProductTable = '''
  CREATE TABLE IF NOT EXISTS Product (
    pk_pid INTEGER PRIMARY KEY,
    productId INTEGER,
    productName TEXT,
    productDescription TEXT,
    productCode TEXT,
    productGroupId INTEGER,
    productGroupName TEXT,
    productPackageId INTEGER,
    packageName TEXT,
    productBrandId INTEGER,
    brandName TEXT,
    productFlavorId INTEGER,
    flavorName TEXT,
    unitCode TEXT,
    cartonCode TEXT,
    unitQuantity INTEGER,
    cartonQuantity INTEGER,
    unitSizeForDisplay TEXT,
    cartonSizeForDisplay TEXT,
    unitStockInHand INTEGER,
    cartonStockInHand INTEGER,
    unitDefinitionId INTEGER,
    cartonDefinitionId INTEGER,
    actualUnitStock INTEGER,
    actualCartonStock INTEGER
);
''';

  static const String createProductGroupTable = '''
  CREATE TABLE IF NOT EXISTS ProductGroups (
    productGroupId INTEGER PRIMARY KEY,
    productGroupName TEXT
);
''';

  static const String createPromotionTable = '''
  CREATE TABLE IF NOT EXISTS Promotions (
    promotionId INTEGER PRIMARY KEY AUTOINCREMENT,
    outletId INTEGER,
    priceConditionId INTEGER,
    detailId INTEGER,
    name TEXT,
    amount REAL,
    calculationType TEXT,
    freeGoodId INTEGER,
    freeGoodName TEXT,
    freeGoodSize TEXT,
    size TEXT,
    promoOrFreeGoodType TEXT,
    freeGoodQuantity INTEGER
);
''';

  static const String createRouteTable = '''
  CREATE TABLE IF NOT EXISTS Routes (
    routeId INTEGER PRIMARY KEY,
    routeName TEXT,
    employeeId INTEGER,
    totalOutlets INTEGER
);
''';

  static const String createTaskTable = '''
  CREATE TABLE IF NOT EXISTS Tasks (
    taskId INTEGER NOT NULL,
    taskTypeId INTEGER NOT NULL,
    taskName TEXT,
    taskDate TEXT,
    outletId INTEGER,
    completedDate TEXT,
    status TEXT,
    remarks TEXT,
    PRIMARY KEY (taskId, taskTypeId)
);
''';

  static const String createFreeGoodsDetailTable = '''
  CREATE TABLE IF NOT EXISTS FreeGoodsDetail (
    freeGoodDetailId INTEGER PRIMARY KEY NOT NULL,
    freeGoodMasterId INTEGER,
    productId INTEGER,
    productCode TEXT,
    productName TEXT,
    productDefinitionId INTEGER,
    typeId INTEGER,
    typeText TEXT,
    minimimQuantity INTEGER,
    forEachQuantity INTEGER,
    freeGoodQuantity INTEGER,
    freeGoodGroupId INTEGER,
    maximumFreeGoodQuantity INTEGER,
    startDate TEXT,
    endDate TEXT,
    isActive INTEGER,
    status TEXT,
    isDifferentProduct INTEGER
);
''';

  static const String createFreeGoodsExclusivesTable = '''
  CREATE TABLE IF NOT EXISTS FreeGoodExclusives (
    freeGoodExclusiveId INTEGER PRIMARY KEY NOT NULL,
    freeGoodGroupId INTEGER,
    productId INTEGER,
    productCode TEXT,
    productName TEXT,
    productDefinitionId INTEGER,
    quantity INTEGER,
    maximumFreeGoodQuantity INTEGER,
    offerType TEXT,
    status TEXT,
    isDeleted INTEGER
);
''';

  static const String createFreeGoodMasterTable = '''
  CREATE TABLE IF NOT EXISTS FreeGoodMasters (
    freeGoodMasterId INTEGER PRIMARY KEY NOT NULL,
    name TEXT,
    isActive INTEGER,
    isDeleted INTEGER,
    isBundle INTEGER,
    accessSequenceId INTEGER,
    accessSequenceText TEXT,
    freeGoodGroups TEXT,
    freeGoodDetails TEXT,
    freeGoodEntityDetails TEXT
);
''';

  static const String createFreeGoodEntityDetailsTable = '''
  CREATE TABLE IF NOT EXISTS FreeGoodEntityDetails (
    freeGoodEntityDetailId INTEGER PRIMARY KEY,
    freeGoodMasterId INTEGER NOT NULL,
    outletId INTEGER NOT NULL,
    routeId INTEGER NOT NULL,
    distributionId INTEGER NOT NULL,
    channelId INTEGER NOT NULL,
    entityCode TEXT NOT NULL,
    entityText TEXT NOT NULL,
    status TEXT NOT NULL,
    location TEXT NOT NULL,
    address TEXT NOT NULL,
    channel TEXT NOT NULL
);
''';

  static const createFreeGoodGroupsTable = '''
  CREATE TABLE IF NOT EXISTS FreeGoodGroups (
    id INTEGER PRIMARY KEY,
    freeGoodMasterId INTEGER NOT NULL,
    name TEXT NOT NULL,
    typeId INTEGER NOT NULL,
    minimumQuantity INTEGER NOT NULL,
    forEachQuantity INTEGER NOT NULL,
    maximumQuantity INTEGER NOT NULL,
    isActive INTEGER
  NOT NULL,
    isDeleted INTEGER
  NOT NULL,
    isDifferentProduct INTEGER
  NOT NULL,
    freeQuantity INTEGER NOT NULL,
    freeQuantityTypeId INTEGER NOT NULL
);
''';

  static const String createFreePriceConditionOutletAttributesTable = '''
  CREATE TABLE IF NOT EXISTS FreePriceConditionOutletAttributes (
    priceConditionOutletAttributeId INTEGER PRIMARY KEY NOT NULL,
    priceConditionId INTEGER,
    channelId INTEGER,
    vpoClassificationId INTEGER,
    outletGroupId INTEGER,
    outletGroup2Id INTEGER,
    outletGroup3Id INTEGER,
    bundleId INTEGER,
    freeGoodId INTEGER
);
''';

  static const String createOutletAvailedFreeGoodsTable = '''
  CREATE TABLE IF NOT EXISTS OutletAvailedFreeGoods (
    id INTEGER PRIMARY KEY NOT NULL,
    outletId INTEGER,
    freeGoodGroupId INTEGER,
    freeGoodDetailId INTEGER,
    freeGoodExclusiveId INTEGER,
    quantity INTEGER,
    productId INTEGER,
    productDefinitionId INTEGER,
    orderId INTEGER,
    invoiceId INTEGER
);
''';

  static const String createPriceAccessSequenceTable = '''
  CREATE TABLE IF NOT EXISTS PriceAccessSequence (
    priceAccessSequenceId INTEGER PRIMARY KEY NOT NULL,
    sequenceCode TEXT,
    sequenceName TEXT,
    "order" INTEGER NOT NULL,
    pricingLevelId INTEGER,
    pricingTypeId INTEGER
);
''';

  static const String createPriceBundleTable = '''
  CREATE TABLE IF NOT EXISTS PriceBundle (
    bundleId INTEGER PRIMARY KEY NOT NULL,
    name TEXT,
    validFrom TEXT,
    validTo TEXT,
    entityGroupById INTEGER,
    bundleMinimumQuantity INTEGER,
    isDeleted INTEGER,
    priceConditionId INTEGER NOT NULL,
    FOREIGN KEY (priceConditionId) REFERENCES PriceCondition(priceConditionId) ON DELETE CASCADE
);
''';

  static const createPriceConditionTable = '''
  CREATE TABLE IF NOT EXISTS PriceCondition (
  priceConditionId INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  isBundle INTEGER,
  pricingType INTEGER,
  validFrom TEXT,
  validTo TEXT,
  entityGroupById INTEGER,
  organizationId INTEGER,
  distributionId INTEGER,
  combinedMaxValueLimit REAL,
  combinedMaxCaseLimit REAL,
  combinedLimitBy INTEGER,
  priceConditionTypeId INTEGER NOT NULL,
  accessSequenceId INTEGER NOT NULL,
  customerRegistrationTypeId INTEGER,
  FOREIGN KEY (priceConditionTypeId) REFERENCES PriceConditionType(priceConditionTypeId) ON DELETE CASCADE,
  FOREIGN KEY (accessSequenceId) REFERENCES PriceAccessSequence(priceAccessSequenceId) ON DELETE CASCADE
);
 CREATE INDEX idx_accessSequenceId ON PriceCondition (accessSequenceId);
 CREATE INDEX idx_priceConditionTypeId ON PriceCondition (priceConditionTypeId);
''';

  static const createPriceConditionEntitiesTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionEntities (
  priceConditionEntityId INTEGER PRIMARY KEY NOT NULL,
  priceConditionId INTEGER NOT NULL,
  outletId INTEGER,
  routeId INTEGER,
  distributionId INTEGER,
  bundleId INTEGER,
  isDeleted INTEGER,
  FOREIGN KEY (priceConditionId) REFERENCES PriceCondition(priceConditionId) ON DELETE CASCADE,
  FOREIGN KEY (bundleId) REFERENCES PriceBundle(bundleId) ON DELETE CASCADE
);
  CREATE INDEX idx_priceConditionId ON PriceConditionEntities (priceConditionId);
  CREATE INDEX idx_bundleId ON PriceConditionEntities (bundleId);
''';

  static const String createPriceConditionDetailTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionDetail (
  priceConditionDetailId INTEGER PRIMARY KEY NOT NULL,
  priceConditionId INTEGER NOT NULL,
  bundleId INTEGER NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  isScale INTEGER NOT NULL,
  validFrom TEXT,
  validTo TEXT,
  type INTEGER NOT NULL,
  isDeleted INTEGER,
  productId INTEGER,
  productDefinitionId INTEGER,
  outletId INTEGER,
  routeId INTEGER,
  distributionId INTEGER,
  minimumQuantity INTEGER DEFAULT 1,
  maximumLimit DECIMAL(10,2),
  limitBy INTEGER,
  cartonAmount REAL,
  packageId INTEGER,
  FOREIGN KEY (priceConditionId) REFERENCES PriceCondition(priceConditionId) ON DELETE CASCADE,
  FOREIGN KEY (bundleId) REFERENCES PriceBundle(bundleId) ON DELETE CASCADE
);
  CREATE INDEX idx_priceConditionId ON PriceConditionDetail (priceConditionId);
  CREATE INDEX idx_bundleId ON PriceConditionDetail (bundleId);
''';

  static const String createPriceConditionAvailedTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionAvailed (
  priceConditionAvailedId INTEGER PRIMARY KEY NOT NULL,
  outletId INTEGER NOT NULL,
  productDefinitionId INTEGER NOT NULL,
  productId INTEGER NOT NULL,
  amount REAL DEFAULT 0.0,
  quantity INTEGER DEFAULT 0
);
''';

  static const String createPriceConditionClassTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionClass (
    priceConditionClassId INTEGER PRIMARY KEY NOT NULL,
    name TEXT,
    "order" INTEGER NOT NULL,
    severityLevel INTEGER NOT NULL,
    severityLevelMessage TEXT,
    pricingAreaId INTEGER,
    distributionId INTEGER,
    organizationId INTEGER,
    canLimit INTEGER,
    code TEXT,
    deriveFromConditionClassId INTEGER
);
''';

  static const String createPriceConditionOutletAttributesTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionOutletAttribute (
    priceConditionOutletAttributeId INTEGER PRIMARY KEY NOT NULL,
    priceConditionId INTEGER,
    channelId INTEGER,
    vpoClassificationId INTEGER,
    outletGroupId INTEGER,
    outletGroup2Id INTEGER,
    outletGroup3Id INTEGER,
    bundleId INTEGER,
    freeGoodId INTEGER
);
''';

  static const String createPriceConditionScaleTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionScale (
  priceConditionScaleId INTEGER PRIMARY KEY NOT NULL,
  "from" INTEGER NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  priceConditionDetailId INTEGER NOT NULL,
  cartonAmount REAL,
  FOREIGN KEY (priceConditionDetailId) REFERENCES PriceConditionDetail(priceConditionDetailId) ON DELETE CASCADE
);
   CREATE INDEX idx_priceConditionDetailId ON PriceConditionScale (priceConditionDetailId);
   CREATE INDEX idx_priceConditionScaleId ON PriceConditionScale (priceConditionScaleId);
''';

  static const String createPriceConditionTypeTable = '''
  CREATE TABLE IF NOT EXISTS PriceConditionType (
  priceConditionTypeId INTEGER PRIMARY KEY NOT NULL,
  name TEXT,
  priceConditionClassId INTEGER NOT NULL,
  operationType INTEGER NOT NULL,
  calculationType INTEGER NOT NULL,
  roundingRule INTEGER NOT NULL,
  priceScaleBasisId INTEGER,
  code TEXT,
  conditionClassId INTEGER,
  pricingType INTEGER,
  processingOrder INTEGER,
  pcDefinitionLevelId INTEGER,
  isPromo INTEGER,
  isLRB INTEGER,
  FOREIGN KEY (priceConditionClassId) REFERENCES PriceConditionClass(priceConditionClassId)
);
   CREATE INDEX idx_priceConditionDetailId ON PriceConditionType (priceConditionDetailId);
   CREATE INDEX idx_priceConditionScaleId ON PriceConditionType (priceConditionScaleId);
''';

  static const String createPriceScaleBasisTable = '''
  CREATE TABLE IF NOT EXISTS PriceScaleBasis (
    priceScaleBasisId INTEGER PRIMARY KEY NOT NULL,
    value TEXT
);
''';

  static const String createPricingAreaTable = '''
CREATE TABLE IF NOT EXISTS PricingArea (
    pricingAreaId INTEGER PRIMARY KEY NOT NULL,
    code TEXT NOT NULL,
    `order` INTEGER,
    name TEXT,
    isActive INTEGER
 
);
''';

  static const String createPricingGroupsTable = '''
  CREATE TABLE IF NOT EXISTS PricingGroups (
    pricingGroupId INTEGER PRIMARY KEY NOT NULL,
    pricingGroupName TEXT,
    status INTEGER NOT NULL
);
''';

  static const String createPricingLevelsTable = '''
CREATE TABLE IF NOT EXISTS PricingLevels (
    pricingLevelId INTEGER PRIMARY KEY NOT NULL,
    value TEXT
);
''';




  //Drop Tables Queries

  static const String dropAssetTable = '''
DROP TABLE IF EXISTS Asset;
''';

  static const String dropAvailableStockTable = '''
DROP TABLE IF EXISTS AvailableStock;
''';

  static const String dropCartonPriceBreakDownTable = '''
DROP TABLE IF EXISTS CartonPriceBreakDown;
''';

  static const String dropCustomerInputTable = '''
DROP TABLE IF EXISTS CustomerInput;
''';

  static const String dropMarketReturnReasonTable = '''
DROP TABLE IF EXISTS MarketReturnReason;
''';

  static const String dropLookUpTable = '''
DROP TABLE IF EXISTS LookUp;
''';

  static const String dropMarketReturnDetailsTable = '''
DROP TABLE IF EXISTS MarketReturnDetails;
''';

  static const String dropMarketReturnsTable = '''
DROP TABLE IF EXISTS MarketReturns;
''';

  static const String dropMerchandiseTable = '''
DROP TABLE IF EXISTS Merchandise;
''';

  static const String dropOrderTable = '''
DROP TABLE IF EXISTS `Order`;
''';

  static const String dropOrderDetailTable = '''
DROP TABLE IF EXISTS OrderDetail;
''';

  static const String dropUnitPriceBreakdownTable = '''
DROP TABLE IF EXISTS UnitPriceBreakDown;
''';

  static const String dropOrderStatusTable = '''
DROP TABLE IF EXISTS OrderStatus;
''';

  static const String dropOutletTable = '''
DROP TABLE IF EXISTS Outlet;
''';

  static const String dropOutletAvailedPromotionTable = '''
DROP TABLE IF EXISTS OutletAvailedPromotion;
''';

  static const String dropPackageTable = '''
DROP TABLE IF EXISTS Package;
''';

  static const String dropProductTable = '''
DROP TABLE IF EXISTS Product;
''';

  static const String dropProductGroupTable = '''
DROP TABLE IF EXISTS ProductGroups;
''';

  static const String dropPromotionTable = '''
DROP TABLE IF EXISTS Promotions;
''';

  static const String dropRouteTable = '''
DROP TABLE IF EXISTS Routes;
''';

  static const String dropTaskTable = '''
DROP TABLE IF EXISTS Tasks;
''';

// Pricing tables
  static const String dropFreeGoodsDetailTable = '''
DROP TABLE IF EXISTS FreeGoodsDetail;
''';

  static const String dropFreeGoodsExclusivesTable = '''
DROP TABLE IF EXISTS FreeGoodExclusives;
''';

  static const String dropFreeGoodEntityDetailsTable = '''
DROP TABLE IF EXISTS FreeGoodEntityDetails;
''';

  static const String dropFreeGoodMasterTable = '''
DROP TABLE IF EXISTS FreeGoodMasters;
''';

  static const String dropFreeGoodGroupsTable = '''
DROP TABLE IF EXISTS FreeGoodGroups;
''';

  static const String dropFreePriceConditionOutletAttributesTable = '''
DROP TABLE IF EXISTS FreePriceConditionOutletAttributes;
''';

  static const String dropOutletAvailedFreeGoodsTable = '''
DROP TABLE IF EXISTS OutletAvailedFreeGoods;
''';

  static const String dropPriceAccessSequenceTable = '''
DROP TABLE IF EXISTS PriceAccessSequence;
''';

  static const String dropPriceBundleTable = '''
DROP TABLE IF EXISTS PriceBundle;
''';

  static const String dropPriceConditionTable = '''
DROP TABLE IF EXISTS PriceCondition;
''';

  static const String dropPriceConditionEntitiesTable = '''
DROP TABLE IF EXISTS PriceConditionEntities;
''';

  static const String dropPriceConditionDetailTable = '''
DROP TABLE IF EXISTS PriceConditionDetail;
''';

  static const String dropPriceConditionAvailedTable = '''
DROP TABLE IF EXISTS PriceConditionAvailed;
''';

  static const String dropPriceConditionClassTable = '''
DROP TABLE IF EXISTS PriceConditionClass;
''';

  static const String dropPriceConditionOutletAttributesTable = '''
DROP TABLE IF EXISTS PriceConditionOutletAttribute;
''';

  static const String dropPriceConditionScaleTable = '''
DROP TABLE IF EXISTS PriceConditionScale;
''';

  static const String dropPriceConditionTypeTable = '''
DROP TABLE IF EXISTS PriceConditionType;
''';

  static const String dropPriceScaleBasisTable = '''
DROP TABLE IF EXISTS PriceScaleBasis;
''';

  static const String dropPricingAreaTable = '''
DROP TABLE IF EXISTS PricingArea;
''';

  static const String dropPricingGroupsTable = '''
DROP TABLE IF EXISTS PricingGroups;
''';

    static const String dropPricingLevelsTable = '''
DROP TABLE IF EXISTS PricingLevels;
''';

}
