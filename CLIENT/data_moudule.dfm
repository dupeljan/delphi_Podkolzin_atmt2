object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 1203
  Width = 714
  object my_database: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\dupel\delphi0520\delphi_Podkolzin_atmt2\DB\VEGETABLES_D' +
      'B.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 56
    Top = 48
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = my_database
    Left = 160
    Top = 48
  end
  object TProvider: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PROVIDER'
    UniDirectional = False
    Left = 48
    Top = 136
  end
  object TProduct: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PRODUCT'
    UniDirectional = False
    Left = 352
    Top = 144
  end
  object spAddProvider: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_PROVIDER'
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeleteProvider: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PROVIDER'
    Left = 128
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spEditProvider: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PROVIDER'
    Left = 208
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end>
  end
  object spAddProduct: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_PRODUCT'
    Left = 336
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeleteProduct: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PRODUCT'
    Left = 408
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spEditProduct: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PRODUCT'
    Left = 496
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'IN_NAME'
        ParamType = ptInput
      end>
  end
  object qProductWithProvider: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select product.id as product_id, provider.id as provider_id,'
      
        '        product.name as product_name, provider.name as provider_' +
        'name'
      'from'
      'product  join provider on  product.provider_id = provider.id;')
    Left = 432
    Top = 144
  end
  object TPurchase_inv: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PURCHASE_INV'
    UniDirectional = False
    Left = 56
    Top = 376
  end
  object TPurchase_inv_item: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PURCHASE_INV_ITEM'
    UniDirectional = False
    Left = 320
    Top = 384
  end
  object spAddPurchase_inv: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_PURCHASE_INV'
    Left = 40
    Top = 456
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IN_SHIPPER_ID'
        ParamType = ptInput
      end>
  end
  object spDeletePurchase_inv: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PURCHASE_INV'
    Left = 136
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spAddPurchase_inv_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_PURCHASE_INV_ITEM'
    Left = 320
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PRICE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_COUNT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PURCHASE_INV_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeletePurcahse_inv_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PURCHASE_INV_ITEM'
    Left = 424
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spEditPurchase_inv: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_PURCHASE_INV'
    Left = 208
    Top = 440
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_SHIPPER_ID'
        ParamType = ptInput
      end>
  end
  object qPurchase_inv_item_filtered: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select purchase_inv_item.id as purchase_inv_item_id,'
      '       purchase_inv_id,'
      '       product_id,provider_id,product_count,price,'
      '       product.name as product_name,'
      '       provider.name as provider_name'
      'from'
      'purchase_inv_item'
      'join'
      'product on purchase_inv_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'where purchase_inv_id = :in_purchase_id ;')
    Left = 440
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_purchase_id'
        ParamType = ptInput
      end>
  end
  object TLoss: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'LOSS'
    UniDirectional = False
    Left = 56
    Top = 584
  end
  object spAddLoss: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_LOSS'
    Left = 48
    Top = 648
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IN_PURCHASE_INV_ID'
        ParamType = ptInput
      end>
  end
  object spDeleteLoss: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_LOSS'
    Left = 112
    Top = 648
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spEditLoss: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_LOSS'
    Left = 168
    Top = 648
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_SUM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PURCHASE_INV_ID'
        ParamType = ptInput
      end>
  end
  object spAddLoss_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_LOSS_ITEM'
    Left = 336
    Top = 640
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_COUNT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_LOSS_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeleteLoss_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_LOSS_ITEM'
    Left = 432
    Top = 640
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object TLoss_item: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'LOSS_ITEM'
    UniDirectional = False
    Left = 336
    Top = 584
  end
  object qLoss_item_filtered: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select loss_item.id as loss_item_id,'
      '       loss_id,'
      '       product_id,provider_id,product_count,'
      '       product.name as product_name,'
      '       provider.name as provider_name'
      'from'
      'loss_item'
      'join'
      'product on loss_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'where loss_id = :in_loss_id;')
    Left = 440
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_loss_id'
        ParamType = ptInput
      end>
  end
  object TDaily_income: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DAILY_INCOME'
    UniDirectional = False
    Left = 56
    Top = 776
  end
  object spAddDaily_income: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_DAILY_INCOME'
    Left = 56
    Top = 840
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeleteDaily_income: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_DAILY_INCOME'
    Left = 112
    Top = 840
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spEditDaily_income: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'EDIT_DAILY_INCOME'
    Left = 168
    Top = 840
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object spAddDaily_income_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_DAILY_ICOME_ITEM'
    Left = 336
    Top = 832
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_COUNT'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IN_DAILY_INCOME_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_ID'
        ParamType = ptOutput
      end>
  end
  object spDeleteDaily_income_item: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_DAILY_INCOME_ITEM'
    Left = 432
    Top = 832
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_ID'
        ParamType = ptInput
      end>
  end
  object TDaily_income_item: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DAILY_INCOME_ITEM'
    UniDirectional = False
    Left = 336
    Top = 776
  end
  object qDaily_income_item_filtered: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select daily_income_item.id as daily_income_item_id,'
      '       daily_income_id,'
      '       product_id,provider_id,product_count,'
      '       product.name as product_name,'
      '       provider.name as provider_name'
      'from'
      'daily_income_item'
      'join'
      'product on daily_income_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'where daily_income_id = :in_daily_income_id;')
    Left = 440
    Top = 776
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_daily_income_id'
        ParamType = ptInput
      end>
  end
  object QLoss_filetered: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from loss'
      'where'
      '    purchase_inv_id = :IN_PURCHASE_INV_ID')
    Left = 120
    Top = 584
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PURCHASE_INV_ID'
        ParamType = ptInput
      end>
  end
  object QDaily_incomeWithPrice: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select daily_income_item.id as daily_income_item_id,'
      '       daily_income_id,'
      '       product_id,provider_id,product_count,'
      '       product.name as product_name,'
      '       provider.name as provider_name,'
      '       price(product_id,the_date)'
      'from'
      'daily_income_item'
      'join'
      'product on daily_income_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'join'
      'daily_income on daily_income.id = daily_income_id'
      'where daily_income_id = :in_daily_income_id;')
    Left = 512
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_daily_income_id'
        ParamType = ptInput
      end>
  end
  object qlist: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      ' provider_id, exel_list_id, shipper.name as provider_name'
      'from'
      'exel_list_item join SHIPPER on PROVIDER_id = SHIPPER.id'
      ';')
    Left = 56
    Top = 944
  end
  object spDeleteList: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_LIST_ITEM'
    Left = 112
    Top = 1016
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end>
  end
  object spAddList: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_LIST_ITEM'
    Left = 32
    Top = 1016
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end>
  end
  object QGetProvider_products: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'select id, name as product_name from product where provider_id =' +
        ' :IN_PROVIDER_ID;')
    Left = 336
    Top = 944
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end>
  end
  object spGetCount: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'GET_PRODUCT_COUNT'
    Left = 432
    Top = 944
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'OUT_COUNT'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_DAILY_INCOME'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_LOSS'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'OUT_PURCH'
        ParamType = ptOutput
      end>
  end
  object spGetPrice: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'GET_PRICE'
    Left = 496
    Top = 944
    ParamData = <
      item
        DataType = ftInteger
        Name = 'OUT_PRICE'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IN_PRODUCT_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE'
        ParamType = ptInput
      end>
  end
  object QGet_Period_Daily_income: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      
        '    daily_income join daily_income_item on daily_income.id = dai' +
        'ly_income_id'
      '    where'
      
        '    product_id in (select id from product where provider_id = :I' +
        'N_PROVIDER_ID)'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date')
    Left = 296
    Top = 1032
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object QGet_Period_Loss: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      '    loss join loss_item on loss.id = loss_id'
      '    where'
      
        '    product_id in (select  id from product where provider_id = :' +
        'IN_PROVIDER_ID)'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date')
    Left = 416
    Top = 1032
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object qGet_global_period_daily_income: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      
        '    daily_income join daily_income_item on daily_income.id = dai' +
        'ly_income_id'
      '    where'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date')
    Left = 288
    Top = 1112
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object qGet_global_period_loss: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      '    loss join loss_item on loss.id = loss_id'
      '    where'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date')
    Left = 432
    Top = 1120
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object qPurchase_inv_item_filered_prov: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select purchase_inv_item.id as purchase_inv_item_id,'
      '       purchase_inv_id,'
      '       product_id,provider_id,product_count,price,'
      '       product.name as product_name,'
      '       provider.name as provider_name'
      'from'
      'purchase_inv_item'
      'join'
      'product on purchase_inv_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'where purchase_inv_id = :in_purchase_id'
      'and provider_id = :in_provider_id ;')
    Left = 592
    Top = 384
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_purchase_id'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'in_provider_id'
        ParamType = ptInput
      end>
  end
  object qPurchase_inv_item_only_povider: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '      DISTINCT provider.id as provider_id,'
      '      provider.name as provider_name,'
      '      shipper.name as shipper_name'
      'from'
      'purchase_inv_item'
      'join'
      'product on purchase_inv_item.product_id = product.id'
      'join'
      'provider on provider.id = provider_id'
      'join'
      
        'purchase_inv on    purchase_inv_item.purchase_inv_id = purchase_' +
        'inv.id'
      'join'
      'shipper on PURCHASE_INV.shipper_id = shipper.id'
      'where purchase_inv_id = :in_purchase_id')
    Left = 576
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_purchase_id'
        ParamType = ptInput
      end>
  end
  object QGet_Period_purchase: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      
        '    purchase_inv join purchase_inv_item on purchase_inv.id = pur' +
        'chase_inv_id'
      '    where'
      
        '    product_id in (select id from product where provider_id = :I' +
        'N_PROVIDER_ID)'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date')
    Left = 568
    Top = 1024
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_PROVIDER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object qGet_global_period_purchase: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    the_date,'
      '    sum(price_ * product_count)as PRICE'
      'from '
      '('
      '    select'
      '        the_date as THE_DATE,'
      '        price(product_id,the_date) as price_,'
      '        product_count'
      '    from'
      
        '    purchase_inv join purchase_inv_item on purchase_inv.id = pur' +
        'chase_inv_id'
      '    where'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0'
      ')'
      'group by the_date'
      '')
    Left = 544
    Top = 1112
    ParamData = <
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
  object TShipper: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'SHIPPER'
    UniDirectional = False
    Left = 48
    Top = 288
  end
  object qInv_full_info: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    d.purchase_inv_id,'
      '    shipper_name,'
      '    shipper_id,'
      '    the_date,'
      '    price as cost,'
      '    coalesce(total_sum,0) as returned,'
      '    price - coalesce(total_sum,0) as return_left,'
      
        '    iif( datediff(DAY,( select cast('#39'Now'#39' as date) from rdb$data' +
        'base)'
      '            ,the_date) >= 90 AND'
      
        '            price - coalesce(total_sum,0) <= 0, '#39#1044#1072#39','#39#1053#1077#1090#39'  ) as' +
        ' inv_expired,'
      '    iif(price - coalesce(total_sum,0) <= 0, '#39#1044#1072#39','#39#1053#1077#1090#39') as debt'
      'from'
      '('
      '    ('
      '        select'
      '            purchase_inv_id,'
      '            price,'
      '            total_sum'
      '            '
      '        from'
      '        ('
      '             ('
      '                /*get full price of purhase */'
      '                select'
      '                    purchase_inv_id,'
      '                    sum(price_ * product_count)as PRICE'
      '                from '
      '                ('
      '                    select'
      '                        the_date as THE_DATE,'
      '                        purchase_inv_id,'
      '                        price(product_id,the_date) as price_,'
      '                        product_count'
      '                    from'
      
        '                    purchase_inv join purchase_inv_item on purch' +
        'ase_inv.id = purchase_inv_id'
      ''
      '                )'
      '                group by  purchase_inv_id'
      '              )  a'
      '              left join'
      '              ('
      '                /* Paid sum for this purchase*/'
      '                select'
      '                    purchase_inv_id as purchase_inv_id_loss,'
      '                    sum(sum_) as total_sum'
      '                from loss'
      '                group by purchase_inv_id'
      '        '
      '              )  b'
      '              on   a.purchase_inv_id = b.purchase_inv_id_loss'
      '        )'
      '     ) c'
      '     join'
      '     (/* date and provider name*/'
      '        select'
      '            shipper.name as shipper_name,'
      '            shipper.id as shipper_id,'
      '            purchase_inv.the_date as the_date,'
      '            purchase_inv.id as purchase_inv_id'
      '        from'
      '            purchase_inv join shipper on'
      '            purchase_inv.shipper_id = shipper.id'
      ''
      '     ) d'
      '     on c.purchase_inv_id = d.purchase_inv_id'
      ')')
    Left = 568
    Top = 728
  end
  object qShippers_Unset: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select id, name,tel from'
      '('
      '    ('
      '       select * from shipper'
      '     )  a'
      '     left join'
      '     ('
      '         select'
      '        provider_id'
      '        from'
      '        exel_list_item join SHIPPER on PROVIDER_id = SHIPPER.id'
      '     ) b'
      '     on a.id = b.provider_id'
      ')'
      'where b.provider_id is null')
    Left = 112
    Top = 944
  end
  object qInv_full_filtered_period: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select'
      '    d.purchase_inv_id,'
      '    shipper_name,'
      '    shipper_id,'
      '    the_date,'
      '    price as cost,'
      '    coalesce(total_sum,0) as returned,'
      '    price - coalesce(total_sum,0) as return_left,'
      
        '    iif( datediff(DAY,( select cast('#39'Now'#39' as date) from rdb$data' +
        'base)'
      '            ,the_date) >= 90 AND'
      
        '            price - coalesce(total_sum,0) <= 0, '#39#1044#1072#39','#39#1053#1077#1090#39'  ) as' +
        ' inv_expired,'
      '    iif(price - coalesce(total_sum,0) <= 0, '#39#1044#1072#39','#39#1053#1077#1090#39') as debt'
      'from'
      '('
      '    ('
      '        select'
      '            purchase_inv_id,'
      '            price,'
      '            total_sum'
      '            '
      '        from'
      '        ('
      '             ('
      '                /*get full price of purhase */'
      '                select'
      '                    purchase_inv_id,'
      '                    sum(price_ * product_count)as PRICE'
      '                from '
      '                ('
      '                    select'
      '                        the_date as THE_DATE,'
      '                        purchase_inv_id,'
      '                        price(product_id,the_date) as price_,'
      '                        product_count'
      '                    from'
      
        '                    purchase_inv join purchase_inv_item on purch' +
        'ase_inv.id = purchase_inv_id'
      ''
      '                )'
      '                group by  purchase_inv_id'
      '              )  a'
      '              left join'
      '              ('
      '                /* Paid sum for this purchase*/'
      '                select'
      '                    purchase_inv_id as purchase_inv_id_loss,'
      '                    sum(sum_) as total_sum'
      '                from loss'
      '                group by purchase_inv_id'
      '        '
      '              )  b'
      '              on   a.purchase_inv_id = b.purchase_inv_id_loss'
      '        )'
      '     ) c'
      '     join'
      '     (/* date and provider name*/'
      '        select'
      '            shipper.name as shipper_name,'
      '            shipper.id as shipper_id,'
      '            purchase_inv.the_date as the_date,'
      '            purchase_inv.id as purchase_inv_id'
      '        from'
      '            purchase_inv join shipper on'
      '            purchase_inv.shipper_id = shipper.id'
      ''
      '     ) d'
      '     on c.purchase_inv_id = d.purchase_inv_id'
      ')'
      'where'
      '    shipper_id = :in_shipper_id'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_BEGIN_DATE) <= 0'
      '    AND'
      '    datediff(DAY,the_date,:IN_DATE_END_DATE)  >= 0')
    Left = 576
    Top = 792
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_SHIPPER_ID'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_BEGIN_DATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'IN_DATE_END_DATE'
        ParamType = ptInput
      end>
  end
end
