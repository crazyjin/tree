$(document).ready ->
  #展开节点
  $('.fa-plus-square-o').click ->
    $(this).parent().next(".content").show()
    $(this).hide()
    $(this).next(".fa-minus-square-o").css('display', 'inline-block')

  #闭合节点
  $('.fa-minus-square-o').click ->
    $(this).parent().next(".content").hide()
    $(this).hide()
    $(this).prev(".fa-plus-square-o").css('display', 'inline-block')

  #节点 actions显示
  $(".node-bar").hover \
    (-> $(this).children('.node-actions').show()), \
    (-> $(this).children('.node-actions').hide())

  #创建新的帧
  $(".add-frame").click ->
    frame = $(".forms > .node.frame").clone(true)

    #设置input值
    frames = $(this).parent().parent().next(".content").children(".content > .frames")
    features = $(this).parent().parent().next(".content").children(".content > .features")

    if $('.node > .content', features).length > 0
      $('.node > .content', features).addClass('fake-rape')

    l = $(".node", frames).length
    input = $('input', frame)
    input.val("Frame " + (l+1))
    frames.append(frame)

    #显示input
    input.show()
    input[0].focus()

    #绑定编辑触发事件处理函数
    input.blur window.node_name_input_blur
    $('.node-name', frame).dblclick  window.edit_node_name

    #编辑节点name
    $(".node-name").dblclick window.edit_node_name
    
    #编辑结束
    $(".name-input").blur window.node_name_input_blur

  $(".add-feature").click ->
    feature = $(".forms > .node.feature").clone(true)

    #设置input的值
    features = $(this).parent().parent().next(".content").children(".content > .features")
    frames = $(this).parent().parent().next(".content").children(".content > .frames")

    if $('.node',frames).length > 0
      content = $('.content', feature).addClass('fake-rape')

    l = features.children(".node").length
    input = $('input', feature)
    input.val("Feature " + (l+1))
    features.append(feature)

    #显示input
    input.show()
    input[0].focus()

    #绑定编辑触发事件处理函数
    input.blur window.node_name_input_blur
    $('.node-name', feature).dblclick  window.edit_node_name

#隐藏输入框, 更新node-name
window.node_name_input_blur = ->
  input = $(this)
  frame_name = input.prev(".node-name")
  frame_name.text(input.val())
  frame_name.show()
  input.hide()

#显示输入框
window.edit_node_name = ->
  node_name = $(this)
  input = node_name.next(".name-input")
  input.val(node_name.text())
  node_name.hide()
  input.show()
  input[0].focus()
