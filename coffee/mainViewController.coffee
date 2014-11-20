exports.generateView = (characters, table) ->

  character_rows = []

  if characters.length > 0
    for character in characters
      row = Ti.UI.createTableViewRow(
        height:'80dp',
        backgroundColor: '#FAFAFA',
        details :
          character
      )

      charName = Ti.UI.createLabel(
          text: character.name,
          font:
              fontSize:'16sp',
          height:'auto',
          left:'80dp',
          top:'20dp',
          color:'#000',
          touchEnabled:false
      )

      charServer = Ti.UI.createLabel(
          text: character.realm,
          font:
              fontSize:'16sp',
          height:'auto',
          left:'80dp',
          bottom:'20dp',
          color:'#757575',
          touchEnabled:false
      )

      divider = Ti.UI.createView(
          height: '2dp',
          width: '100%',
          backgroundColor : '#eee',
          left: 0, bottom: 0
      )

      thumbnail = Ti.UI.createImageView(
          height: '40dp',
          width: '40dp',
          backgroundColor : '#ccc',
          borderRadius : '20dp',
          right : '20dp',
          top : '20dp'
      )

      if character.thumbnail then thumbnail.setImage(character.thumbnail)

      row.add(charName)
      row.add(charServer)
      row.add(thumbnail)
      row.add(divider)

      character_rows.push(row)

  else
      row = Ti.UI.createTableViewRow(
        height: '300dp',
        backgroundColor: '#EEE',
      )

      emptyLabel = Ti.UI.createLabel(
        text : 'No character data.\nAdd some to start collecting TLPD data!'
        font :
            fontSize : '16dp'
            fontWeight : 'bold'
        color : '#9E9E9E'
        textAlign : Titanium.UI.TEXT_ALIGNMENT_CENTER
      )

      row.add(emptyLabel)
      character_rows.push(row)

    table.setData(character_rows)