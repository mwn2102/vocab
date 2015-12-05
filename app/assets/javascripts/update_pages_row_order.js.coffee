jQuery ->
  if $('#sortable').length > 0
    #table_width = $('#sortable').width()
    #cells = $('.table').find('tr')[0].cells.length
    #desired_width = table_width / cells + 'px'
    #$('.table td').css('width', desired_width)

    #after I added width percentages to the <td>, I didn't need the above code
    
    $('#sortable').sortable(
      axis: 'y'
      items: '.todo'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        # highlight the row on drop to indicate an update
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('page-id')
        console.log(item_id)
        position = ui.item.index() # this will not work with paginated items, as the index is zero on every page
        $.ajax(
          type: 'POST'
          url: '/pages/update_row_order'
          dataType: 'json'
          data: { page: {word_id: item_id, row_order_position: position } }
        )
    )