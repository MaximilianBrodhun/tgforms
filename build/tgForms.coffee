class tgForms

  ##### Variables #####

  # Object for the field templates, filled durgin the build process

  templates = {}

  templates["tgforms:button"] = "<div class=\"form-group tgforms:button {{ rdf:Property }}\" data-tgforms-type=\"tgforms:button\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    <span class=\"label\">{{ rdfs:label }}</span>\n
    {{#rdfs:comment}}\n
    <span title=\"{{.}}\" class=\"glyphicon glyphicon-info-sign icon-info\"></span>\n
    {{/rdfs:comment}}\n
    <div>\n
      <span class=\"value\">{{ tgforms:hasDefault }}</span>\n
      \n
      {{#tgforms:buttonID}}\n
      	{{#tgforms:isMandatory}}\n
  			<button type=\"button\" class=\"btn btn-default formularOp\" id=\"{{tgforms:buttonID}}\" required>Choose</button>\n
  	    	<button type=\"button\" class=\"btn btn-default {{tgforms:buttonID}}\" id=\"removeFormular\" disabled=\"disabled\">Remove</button>\n
  	    {{/tgforms:isMandatory}}\n
  	    {{^tgforms:isMandatory}}\n
  	    	<button type=\"button\" class=\"btn btn-default formularOp\" id=\"{{tgforms:buttonID}}\">Choose</button>\n
  	    	<button type=\"button\" class=\"btn btn-default {{tgforms:buttonID}}\" id=\"removeFormular\" disabled=\"disabled\">Remove</button>\n
  	    {{/tgforms:isMandatory}}\n
  	{{/tgforms:buttonID}}	\n
      {{^tgforms:buttonID}}\n
      	{{#tgforms:isMandatory}}\n
      		<button type=\"button\" class=\"btn btn-default searchOp\" required>Choose</button>\n
      		<button type=\"button\" class=\"btn btn-default\" id=\"removeContent\" disabled=\"disabled\">Remove</button>\n
      	{{/tgforms:isMandatory}}\n
      	{{^tgforms:isMandatory}}\n
      	    <button type=\"button\" class=\"btn btn-default searchOp\">Choose</button>\n
      		<button type=\"button\" class=\"btn btn-default\" id=\"removeContent\" disabled=\"disabled\">Remove</button>\n
      	{{/tgforms:isMandatory}}\n
      {{/tgforms:buttonID}}\n
      \n
    </div>\n
  </div>"

  templates["tgforms:checkbox"] = "<div class=\"form-group tgforms:checkbox {{ rdf:Property }}\" data-tgforms-type=\"tgforms:checkbox\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    \n
    <label>\n
       {{#tgforms:hasFieldFunction}}\n
      	{{#tgforms:isMandatory}}\n
      		<input type=\"checkbox\" style=\"width:16px;height:16px;\" onblur=\"{{.}}\" required >\n
      	{{/tgforms:isMandatory}}\n
      	{{^tgforms:isMandatory}}\n
      		<input type=\"checkbox\" style=\"width:16px;height:16px;\" onblur=\"{{.}}\" >\n
      	{{/tgforms:isMandatory}}\n
      {{/tgforms:hasFieldFunction}}\n
      {{^tgforms:hasFieldFunction}}\n
         	{{#tgforms:isMandatory}}\n
      		<input type=\"checkbox\" style=\"width:16px;height:16px;\" required>\n
      	{{/tgforms:isMandatory}}\n
      	{{^tgforms:isMandatory}}\n
      		<input type=\"checkbox\" style=\"width:16px;height:16px;\">\n
      	{{/tgforms:isMandatory}}    	\n
      {{/tgforms:hasFieldFunction}}\n
      <span class=\"label\">{{ rdfs:label }}</span>\n
    {{#rdfs:comment}}\n
    	<span title=\"{{.}}\" class=\"glyphicon glyphicon-info-sign icon-info\"></span>\n
    {{/rdfs:comment}}   \n
      \n
    </label>  \n
  </div>"

  templates["tgforms:dropdown"] = "<div class=\"form-group tgforms:dropdown {{ rdf:Property }}\" data-tgforms-type=\"tgforms:dropdown\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    <span class=\"label\">{{ rdfs:label }}</span>\n
    {{#rdfs:comment}}\n
    <span title=\"{{.}}\" class=\"glyphicon glyphicon-info-sign icon-info\"></span>\n
    {{/rdfs:comment}}\n
    <div class=\"btn-group\">\n
    \n
  	{{#tgforms:isMandatory}}  \n
      	<button id=\"{{rdf:Property}}\" type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" required>\n
        		<span class=\"value\">{{ tgforms:hasDefault }}</span><span class=\"caret\"></span>\n
      	</button>\n
      {{/tgforms:isMandatory}}\n
      {{^tgforms:isMandatory}}\n
      	<button id=\"{{rdf:Property}}\" type=\"button\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\">\n
        		<span class=\"value\">{{ tgforms:hasDefault }}</span><span class=\"caret\"></span>\n
      	</button>\n
      {{/tgforms:isMandatory}}    \n
      \n
      <ul class=\"dropdown-menu dropdown-menu\" role=\"menu\">\n
        {{#tgforms:hasOption}}\n
          <li><a href=\"javascript:return false\">{{.}}</a></li>\n
        {{/tgforms:hasOption}}\n
      </ul>\n
    </div>\n
  </div>\n
  "

  templates["tgforms:hidden"] = "<div class=\"form-group tgforms:hidden {{ rdf:Property }} hidden\" data-tgforms-type=\"tgforms:hidden\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    <label>\n
      <span class=\"label\">{{ rdfs:label }}</span>\n
      <input type=\"text\" class=\"form-control\">\n
    </label>\n
  </div>"

  templates["tgforms:text"] = "<div class=\"form-group tgforms:text {{ rdf:Property }}\" data-tgforms-type=\"tgforms:text\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    <label>\n
      <span class=\"label\">{{ rdfs:label }}</span>\n
      \n
      {{#rdfs:comment}}\n
       <span title=\"{{.}}\" class=\"glyphicon glyphicon-info-sign icon-info\"></span>\n
      {{/rdfs:comment}}\n
      \n
      {{#tgforms:hasDefault}}\n
      	<input type=\"text\" class=\"form-control\" value=\"{{.}}\">\n
      {{/tgforms:hasDefault}}\n
      \n
    \n
      {{#tgforms:hasFieldFunction}}\n
      	{{#tgforms:isMandatory}}    	\n
      		<input type=\"text\" onblur=\"{{.}}\" class=\"{{rdf:Property}} form-control\" required>\n
      	{{/tgforms:isMandatory}}\n
      	{{^tgforms:isMandatory}}\n
      		<input type=\"text\" onblur=\"{{.}}\" class=\"{{rdf:Property}} form-control\" >\n
      	{{/tgforms:isMandatory}}\n
      {{/tgforms:hasFieldFunction}}\n
      {{^tgforms:hasFieldFunction}}\n
         	{{#tgforms:isMandatory}}\n
      		<input id=\"{{rdf:Property}}\" type=\"text\" class=\"form-control\" required>\n
      	{{/tgforms:isMandatory}}\n
      	{{^tgforms:isMandatory}}\n
      		<input id=\"{{rdf:Property}}\" type=\"text\" class=\"form-control\">\n
      	{{/tgforms:isMandatory}}    	\n
      {{/tgforms:hasFieldFunction}}\n
  \n
    </label>\n
    <span>\n
  </div>"

  templates["tgforms:textarea"] = "<div class=\"form-group tgforms:textarea {{ rdf:Property }}\" data-tgforms-type=\"tgforms:textarea\" data-tgforms-name=\"{{ rdf:Property }}\">\n
    <label>\n
      <span class=\"label\">{{ rdfs:label }}</span>\n
        {{#rdfs:comment}}\n
    		<span title=\"{{.}}\" class=\"glyphicon glyphicon-info-sign icon-info\"></span>\n
    	  {{/rdfs:comment}}\n
      <textarea class=\"form-control\" rows=\"5\"></textarea>\n
    </label>\n
  \n
  </div>"

  # Regular expressions used to add icons to the field labels

  labelSearch = new RegExp("<span class=\"label\">(.*)<\/span>")
  resourceReplace = "<span class=\"label\">$1<\/span><span class=\"resource " +
      "glyphicon glyphicon-link icon-link\" aria-hidden=\"true\"></span>"
  repeatReplace = "<span class=\"label\">$1<\/span><span class=\"repeat " +
      "glyphicon glyphicon-plus icon-plus\" aria-hidden=\"true\"></span>"
  deleteReplace = "<span class=\"label\">$1<\/span><span class=\"delete " +
      "glyphicon glyphicon-minus icon-minus\" aria-hidden=\"true\"></span>"
  mandatoryReplace = "<span class=\"label\">$1<\/span><span class=\"mandatory " +
      "glyphicon glyphicon-asterisk icon-asterisk\" aria-hidden=\"true\"></span>"

  parser = N3.Parser()
  store = N3.Store()
  util = N3.Util
  divid = ""
  helptext = ""


  ##### Private methods #####

  abbrevURI = (string) ->
    for prefix, uri of getPrefixes()
      string = string.replace(uri, prefix + ":")

    return string

  addToJSONLD = (jsonLD, domObject) ->

    if domObject.attr("type") is "checkbox"
      if domObject.prop("checked")
        newValue = true
      else
        return jsonLD

    if domObject.attr("type") is "text"
      if domObject.val()
        newValue = domObject.val()
      else
        return jsonLD

    if domObject.prop("tagName") is "SPAN"
      if domObject.text()
        newValue = domObject.text()
      else
        return jsonLD

    if domObject.prop("tagName") is "TEXTAREA"
      if domObject.val()
        newValue = domObject.val()
      else
        return jsonLD

    key = domObject.closest("div.form-group").attr("data-tgforms-name")

    if isResource(key)
      newValue = {"@id": newValue}

    oldValue = jsonLD[key]

    if oldValue instanceof Array
      jsonLD[key].push(newValue)
    else if oldValue
      jsonLD[key] = [oldValue, newValue]
    else
      jsonLD[key] = newValue

    return jsonLD

  expandPrefix = (string) ->
    return util.expandPrefixedName(string, getPrefixes())
  
  getClasses = (subject) ->
    rdfClasses = [subject]
    subClassOfTriples = store.find(subject, "rdfs:subClassOf", null)

    for subClassOfTriple in subClassOfTriples
      rdfClass = abbrevURI(subClassOfTriple.object)
      rdfClasses.push(rdfClass)
      
      
      for rdfClass in getClasses(rdfClass)
        if rdfClasses.indexOf(rdfClass) is -1
          rdfClasses.push(rdfClass)

    return rdfClasses

  getFieldHTML = (fieldObject) ->
    template = templates[fieldObject["tgforms:hasInput"]]
    fieldHTML = Mustache.render(template, fieldObject)

    if isResource(fieldObject["rdf:Property"])
      fieldHTML = fieldHTML.replace(labelSearch, resourceReplace)

    if fieldObject["tgforms:isRepeatable"]
      fieldHTML = fieldHTML.replace(labelSearch, repeatReplace)
    
    if fieldObject["tgforms:isMandatory"]
      fieldHTML = fieldHTML.replace(labelSearch, mandatoryReplace)
        
            

    return fieldHTML

  getFieldObject = (fieldName) ->
    field = {}

    propTriples = store.find(fieldName, null, null)
    field["rdf:Property"] = abbrevURI(propTriples[0].subject)
    field["tgforms:hasOption"] = []

    for propTriple in propTriples
      key = propTriple.predicate
      key = abbrevURI(key)

      value = propTriple.object

      if util.isLiteral(value)
        value = util.getLiteralValue(value)

      value = abbrevURI(value)

      if key is "tgforms:hasOption"
        field["tgforms:hasOption"].push(value)
      else
        field[key] = value

    if not field["tgforms:hasInput"]
      field["tgforms:hasInput"] = "tgforms:text"

    field["tgforms:hasOption"] = field["tgforms:hasOption"]
    field["tgforms:hasPriority"] = parseInt(field["tgforms:hasPriority"])

    if field["tgforms:isRepeatable"] isnt "false"
      field["tgforms:isRepeatable"] = true
    else
      field["tgforms:isRepeatable"] = false
    
    if field["tgforms:hasSubformular"] is "true"
      
      buttonID = field["tgforms:buttonID"]
      propertyName = field["tgforms:propertyName"]
      formularToLoad = field["rdfs:range"]
      propertyName = propertyName.split ":"
      

      $(document).on('click', 'div.'+ propertyName[0] + '\\:' + propertyName[1] + ' button#' + buttonID, (e) ->
        
        if($(this).attr('disabled') != "disabled")
            divid = generateId()
            genid= propertyName[0] + '_' + propertyName[1] + divid
            genid2= propertyName[0] + ':' + propertyName[1] + divid
            
            $(this).parent().find('span.value').html(genid2)
            buttonUUID = generateId()        

            fdiv = $('<div id="'+genid+'" class="' + propertyName[1] + ' subformular collapse in "'+buttonID+'">content</div>')
            $(this).parent().append('<button type="button" data-toggle="collapse" data-target="div#'+genid+'"><span class="glyphicon glyphicon-menu-down"></span></button>').append(fdiv)
            tgf.buildForm(formularToLoad, fdiv)
            tgf.fillForm(genid2, fdiv)
        
            $(this).attr('disabled', 'disabled')
            $(this).next().removeAttr('disabled')	
      )

    return field

  getFormTriples = (subject) ->
    formTriples = []
    rdfClasses = getClasses(subject)

    for rdfClass in rdfClasses
      triples = store.find(null, null, rdfClass)
      for triple in triples
        if triple.predicate is expandPrefix("rdfs:domain")
          formTriples.push(triple)
        else if triple.predicate is expandPrefix("rdf:first")

          listStart = getListStart(triple.subject)
          listStart.object = expandPrefix(rdfClass)

          if listStart.predicate is expandPrefix("rdfs:domain")
            formTriples.push(listStart)

    return formTriples

  getList = (subject) ->
    list = []

    firstObject = store.find(subject, "rdf:first", null)[0].object
    restObject = store.find(subject, "rdf:rest", null)[0].object

    list.push(abbrevURI(firstObject))

    if abbrevURI(restObject) isnt "rdf:nil"
      for element in getList(restObject)
        list.push(abbrevURI(element))

    return list

  getListStart = (object) ->
    triple = store.find(null, null, object)

    if util.isBlank(triple[0].subject)
      return getListStart(triple[0].subject)
    else
      return triple[0]

  getPrefixes = ->
    return store._prefixes

  getUnionOf = (subject, predicate) ->
    mainObject = store.find(subject, predicate, null)[0].object
    unionOfObject = store.find(mainObject, "owl:unionOf", null)[0].object
    return unionOfObject

  isResource = (subject) ->
    rangeObject = store.find(subject, "rdfs:range", null)[0].object
    result = false

    if not abbrevURI(rangeObject).match(/^xsd:/)
      result = true

      if util.isBlank(rangeObject)
        for element in getList(getUnionOf(subject, "rdfs:range"))
          if element.match(/^xsd:/)
            result = result and false

    return result

  prefixCall = (prefix, uri) ->
    store.addPrefix(prefix, uri)

  repeatField = ->
    $this = $(this)
    fieldName = $this.closest("div.form-group").attr("data-tgforms-name")
    fieldHTML = getFieldHTML(getFieldObject(fieldName))
    fieldHTML = fieldHTML.replace(labelSearch, deleteReplace)

    $this.closest("div.form-group").after(fieldHTML)
    $("span.repeat").unbind("click").click(repeatField)

    $this.closest("div.form-group").next().find("span.delete").click(->
      $(this).closest("div.form-group").remove()
    )

    focusCall = -> $this.closest("div.form-group").next().find("input").focus()
    setTimeout(focusCall, 25)

  sortFields = (a, b) ->
    if a["tgforms:hasPriority"] > b["tgforms:hasPriority"]
      return -1
    else
      return 1


  ##### Public methods #####

  abbrevURI: (string) ->
    return abbrevURI(string)

  addTurtle: (turtle, addCall) ->
    tripleCall = (error, triple, prefixes) ->
      if triple
        store.addTriple(triple)
      else
        addCall()

    parser.parse(turtle, tripleCall, prefixCall)

  buildForm: (formName, selector) ->
    form = []
    formularNames = store.find(formName, "rdfs:label", null)
    
    for formularNames in formularNames
        formularDisplayName = formularNames.object  
        formularDisplayName = formularDisplayName.split "@"
        formularDisplayName2 = formularDisplayName[0].split "\""

   
    
    classHelpTexts = store.find(formName, "tgforms:helptext", null)
    
    for classHelpText in classHelpTexts
       helptext = classHelpText.object
       
    #added a helptext out of the field rdf:comment from the field tgforms:helptext in rdfs:class
    formHTML = "<form role=\"form\" class=\"tgForms\">
                                <fieldset>
                                    <legend>
                                        <span title=" + helptext + ">" + formularDisplayName2[1] + "</span>
                                    </legend>"

    for formTriple in getFormTriples(formName)
      form.push(getFieldObject(formTriple.subject))

    form = form.sort(sortFields)

    for fieldObject in form
      formHTML += getFieldHTML(fieldObject)
    
    formHTML += "</fieldset></form>"
    $(selector).html(formHTML)
    
    $("div.subformular").prev().removeAttr('disabled')
    $("div.subformular").prev().prev().attr('disabled','disabled')

    #added a button functionallity for deleting the content from the whole formular or subformular
    $("button#removeContent").each( ->
        if($(this).prev().prev().text().length > 0)
            $(this).removeAttr('disabled')
            $(this).prev().attr("disabled", "disabled")
    )

    $("span.repeat").unbind("click").click(repeatField)

    $("form.tgForms").on("click", "ul.dropdown-menu li", ->
      $(this).closest("div.form-group").find("span.value").text($(this).text())
    )
    
    $('.dropdown-toggle').click((e) ->
       e.preventDefault()
    )

    $('input#idiom\\:identifier').attr('readonly', 'true')
    $('input#idiom\\:graphNumber').attr('readonly', 'true')

    if(formularDisplayName2[1] == "Source")
      $('div.dct\\:isReferencedBy').each( ->
        id = $(this).children().children().last().attr('id')
        if($('div#' + id + ' button#reloadCitation').size() == 0 )
          $('div#' + id + ' button#removeContent').after('\n<button type="button" class="btn btn-default" id="reloadCitation">Reload</button>')
        $('input#dct\\:bibliographicCitation').attr('readonly', 'true')
      )
      

    if(formularDisplayName2[1] == "Acquisition" || formularDisplayName2[1] == "Custody" || formularDisplayName2[1] == "Scholarly Discovery" || formularDisplayName2[1] == "Production")
      $(".idiom\\:activityType").remove()
      $(".idiom\\:performedBy").remove()

    if(formularDisplayName2[1] == "Artefact Type Assignment")
        $(".idiom\\:activityType").remove()
        $(".idiom\\:activityTitle").remove()
        $(".crm\\:P7_took_place_at").remove()
        $(".idiom\\:performedBy").remove()

    if(formularDisplayName2[1] == "Part Removal")
        $(".idiom\\:activityType").remove()
        parentCheck = $("legend").text()

    if(formularDisplayName2[1] == "Visual Document")
        $(".crm\\:P62_depicts").remove()

    if(formularDisplayName2[1] == "Non-Epigraphic Group")
        $(".idiom\\:prefActorAppellation").remove()
        $(".idiom\\:altActorAppellation").remove()

    if(formularDisplayName2[1] == "Non-Epigraphic Person")
        $(".idiom\\:prefActorAppellation").remove()
        $(".idiom\\:altActorAppellation").remove()
        $(".crm\\:P100i_died_in").remove()
        $(".crm\\:P98i_was_born").remove()
    

  fillForm: (subject, selector) ->
    triples = store.find(subject, null, null)
    for triple in triples
      predicate = triple.predicate
      fieldName = abbrevURI(predicate)
      object = triple.object

      if util.isLiteral(object)
        object = util.getLiteralValue(object)

      object = abbrevURI(object)      
    

      escapedName = fieldName.replace(":", "\\:")
      $this = $(selector + " div." + escapedName).last()

      if $this.find("input").attr("type") is "checkbox"
        if object is "true"
          $this.find("input").prop("checked", true)

      if $this.find("input").attr("type") is "text"
        if $this.find("input").val()
          fieldHTML = getFieldHTML(getFieldObject(fieldName))
          fieldHTML = fieldHTML.replace(labelSearch, deleteReplace)
          $this.closest("div.form-group").after(fieldHTML)
          $this.closest("div.form-group").next().find("input").val(object)          
        else
          $this.find("input").val(object)         

      if $this.find("span.value")
        if $this.find("span.value").text()          
          fieldHTML = getFieldHTML(getFieldObject(fieldName))
          fieldHTML = fieldHTML.replace(labelSearch, deleteReplace)
          $this.closest("div.form-group").after(fieldHTML)
          $this.closest("div.form-group").next().find("span.value").text(object)          
          if(object.match(/^textgrid:/) || object.match(/^http:\/\/idiom-projekt.de\/voc/))              
              getTitleInsteadOfUri(object, escapedName, $this)
        else          
          $this.find("span.value").text(object)
          if(escapedName == "idiom\\:identifier")
              $('input#idiom\\:identifier').attr('readonly', 'true')
          if(object.match(/^textgrid:/)  || object.match(/^http:\/\/idiom-projekt.de\/voc/))
            if(escapedName == "idiomcat\\:hasDigitalImage" || 
               escapedName == "idiomcat\\:imageInCatalogue")
              getImageInsteadOfUri(object, $this, false)
            if(escapedName == "idiomcat\\:isDerivedFrom" || 
               escapedName == "idiomcat\\:isDividedInto" || 
               escapedName == "idiomcat\\:isMergedInto" || 
               escapedName == "idiomcat\\:containsIconicElementsFrom" || 
               escapedName == "idiomcat\\:sharesDiagnosticElementsWith" || 
               escapedName == "idiomcat\\:isDistinctAllographTo" || 
               escapedName == "idiomcat\\:isSameAs")
              getImageInsteadOfUri(object, $this, true)
            else
              getTitleInsteadOfUri(object, escapedName, $this)

      if $this.find("textarea")
        if $this.find("textarea").val()
          fieldHTML = getFieldHTML(getFieldObject(fieldName))
          fieldHTML = fieldHTML.replace(labelSearch, deleteReplace)
          $this.closest("div.form-group").after(fieldHTML)
          $this.closest("div.form-group").next().find("textarea").val(object)
        else
          $this.find("textarea").val(object)
      
    $("span.repeat").unbind("click").click(repeatField)

    $("span.delete").unbind("click").click(->
      $(this).closest("div.form-group").remove()
    )

  
    

  getFieldHTML: (fieldObject) ->
    return getFieldHTML(fieldObject)

  getFieldObject: (fieldName) ->
    return getFieldObject(fieldName)

  getFormField: (fieldName) ->
    # DEPRECATED as of 04/09/15: Please use getFieldObject instead
    console.log("getFormField is DEPRECATED: Please use getFieldObject instead")
    return getFieldObject(fieldName)

  getInput: (subject, type, selector) ->
    jsonLD = {
      "@context": getPrefixes(),
      "@id": subject,
      "@type": type
    }
    

    $(selector + " input").filter(->
      return $(this).closest("fieldset").closest("div").attr("id") is $(selector).attr("id")
    ).each(->
      $this = $(this)
      jsonLD = addToJSONLD(jsonLD, $this)
    )

    $(selector + " span.value").filter(->
      return $(this).closest("fieldset").closest("div").attr("id") is $(selector).attr("id")
    ).each(->
      $this = $(this)
      jsonLD = addToJSONLD(jsonLD, $this)
    )

    $(selector + " textarea").filter(->
      return $(this).closest("fieldset").closest("div").attr("id") is $(selector).attr("id")
    ).each(->
      $this = $(this)
      jsonLD = addToJSONLD(jsonLD, $this)
    )

    return jsonLD

  getPrefixes: ->
    return getPrefixes()

  getStore: ->
    return store

  getType: (subject) ->
    type = store.find(subject, "rdf:type", null)[0].object
    type = util.getLiteralValue(type) if util.isLiteral(type)
    return abbrevURI(type)


  renderField: (fieldObject) ->
    # DEPRECATED as of 04/09/15: Please use makeField instead
    console.log("renderField is DEPRECATED: Please use getFieldHTML instead")
    return getFieldHTML(fieldObject)


  generateId = ->
    chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    today = new Date()
    result = today.valueOf().toString 16
    result += chars.substr Math.floor(Math.random() * chars.length), 1
    result += chars.substr Math.floor(Math.random() * chars.length), 1
    return result

  getDivId = ->
    return divid

  clearForm = ->    
    divID = $(this).attr('id')

#######################
## Button Clear Form ##
#######################

  $(document).on("click", "button.clearForm", (e) ->
    e.preventDefault()
    divID = $(this).attr("id")
    $("div#"+ divID + " input").val('')
    $("div#"+ divID + " textarea").val('')
    $("div#"+ divID + " button[class=\"btn btn-default dropdown-toggle\"] span[class=\"value\"]").text("")
    
  )

  $(document).on("click", "button#removeContent", (e) ->
    e.preventDefault()
    divID = $(this).parent().parent().attr('data-tgforms-name')
    divID = divID.replace(":", "\\:")    
    $(this).prev().prev().text('')
    $(this).attr('disabled','disabled')
    $(this).prev().removeAttr('disabled')
  )

  $(document).on("click", "button#removeFormular", (e) ->
    e.preventDefault()
    id = $(this).attr('class').split(' ')[2]
    divID = $(this).parent().parent().attr('data-tgforms-name')
    divID = divID.replace(":", "\\:")

    divID2 = $(this).parent().children(':first-child').text()
    divID2 = divID2.replace(":", "_")
    $("div#" + divID2).remove()
    $(this).parent().children(':first-child').text('')
    $("button[data-target='div#" + divID2 + "']").remove()
    $(this).attr("disabled", "disabled")
    $(this).prev().removeAttr('disabled')
    string = $(this).prev().text()
  )

################################
## Check for Mandatory Fields ##
################################

checkMandatory = () ->
    mandatoryInputFilled = true

    $('input[required]').each( ->
        if($(this).val().length == 0)
            mandatoryInputFilled = false
        else
            $(this).removeAttr("style")
            mandatoryInputFilled = true
    )

    if(mandatoryInputFilled == false)
        alert "Fill in the required fields"

        $('input[required]').each( ->
            if($(this).val().length == 0)
                $(this).attr("style", "border:1px solid #ff0000")            
        )

    else
        mandatoryInputFilled = true


checkMandatoryButton = () ->
    mandatoryButtonFilled = true    
    
    $('button.formularOp[required], button.searchOp[required]').each( ->
        if($(this).prev().text().length == 0)
            mandatoryButtonFilled = false
        else            
            $(this).removeAttr("style")
            mandatoryButtonFilled = true
    )

    if(mandatoryButtonFilled == false)
        alert "Fill in the required fields"

        $('button.formularOp[required], button.searchOp[required]').each( ->
            if($(this).prev().text().length == 0)
                $(this).attr("style", "border:1px solid #ff0000")            
        )
    else
        mandatoryButtonFilled = true

checkMandatoryDropdown = () ->
    mandatoryDropdownFilled = true    
    
    $('button.dropdown-toggle[required]').each( ->
        if($(this).children().text().length == 0)
            mandatoryDropdownFilled = false
        else
            $(this).removeAttr("style")
            mandatoryDropdownFilled = true
    )

    if(mandatoryDropdownFilled == false)
        alert "Fill in the required fields"

        $('button.dropdown-toggle[required]').each( ->
            if($(this).children().text().length == 0)
                $(this).attr("style", "border:1px solid #ff0000")           
        )
        
    else
        mandatoryDropdownFilled = true  



