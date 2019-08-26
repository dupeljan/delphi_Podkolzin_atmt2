object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 577
  Width = 646
  object my_database: TIBDatabase
    Connected = True
    DatabaseName = 
      'C:\Users\dupel\OneDrive\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\DELPHI '#1047#1040#1063#1045#1058' ATTEMPT 2\DB\V' +
      'EGETABLES_DB.FDB'
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
    Active = True
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
    Left = 48
    Top = 336
  end
  object TPurchase_inv_item: TIBTable
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PURCHASE_INV_ITEM'
    UniDirectional = False
    Left = 312
    Top = 344
  end
  object spAddPurchase_inv: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'ADD_PURCHASE_INV'
    Left = 48
    Top = 400
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
  object spDeletePurchase_inv: TIBStoredProc
    Database = my_database
    Transaction = IBTransaction1
    StoredProcName = 'DELETE_PURCHASE_INV'
    Left = 136
    Top = 400
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
    Left = 312
    Top = 408
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
    Left = 416
    Top = 408
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
    Left = 200
    Top = 400
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
  object qPurchase_inv_item_filtered: TIBQuery
    Database = my_database
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select purchase_inv_item.id as purchase_inv_item_id,'
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
    Left = 424
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_purchase_id'
        ParamType = ptInput
      end>
  end
end
