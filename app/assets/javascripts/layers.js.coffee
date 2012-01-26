Ext.onReady ->
  Layer = Ext.define "Layer",
    extend: "Ext.data.Model"
    fields: [
      name: "id"
      type: "int"
    ,
      name: "name"
      type: "string"
    ]
    proxy:
      type: "rest"
      url: "/layers"
      headers:
        'Accept': 'application/json'
      reader:
        type: "json"

  Ext.create "Ext.data.Store",
    storeId: "layers"
    model: "Layer"
    autoLoad: true
    autoSync: true

  Ext.create "Ext.grid.Panel",
    title: "Layers"
    store: Ext.data.StoreManager.lookup("layers")
    height: 200
    width: 400
    renderTo: Ext.getBody()
    columns: [
      header: "Id"
      dataIndex: "id"
    ,
      header: "Name"
      dataIndex: "name"
      flex: 1
    ]


  #Layer = Ext.ModelMgr.getModel "Layer"

  store = Ext.data.StoreManager.lookup("layers")

  store.add [
    name: 'ccc'
  ,
    name: 'ddd'
  ]
