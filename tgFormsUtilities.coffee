sparqlEndpoint = "https://www.classicmayan.org/trip/metadata/query"

##################
## URI Replace ###
##################

getTitleInsteadOfUri = (uri, fieldName, $this) ->
        
  
    vocabularyRequest = false

    if (fieldName == "idiomcat\\:isGraphOf" || 
        fieldName == "idiomcat\\:isDerivedFrom" || 
        fieldName == "idiomcat\\:isDividedInto" || 
        fieldName == "idiomcat\\:isMergedInto" || 
        fieldName == "idiomcat\\:containsIconicElementsFrom" || 
        fieldName == "idiomcat\\:sharesDiagnosticElementsWith" )
            query = 'SELECT ?result WHERE { GRAPH <' + uri + '> { ?tgObject idiomcat:signNumber ?result }}'
    if(
        fieldName == "crm\\:P89_falls_within" || 
        fieldName == "crm\\:P121_overlaps_with" || 
        fieldName == "crm\\:P122_borders_with" || 
        fieldName == "crm\\:P7_took_place_at" ||
        fieldName == "crm\\:P74_has_current_or_former_residence" ||
        fieldName == "idiom\\:findingSpotOfRemains")

            query = 'SELECT ?result WHERE { GRAPH <' + uri + '> { ?tgObject crm:P87_is_identified_by ?titleRef. ?titleRef idiom:placeName ?result. ?titleRef idiom:placeNameType "preferred". }}'
    if(
        fieldName == "idiom\\:relatedActivity" || 
        fieldName == "idiom\\:wasFoundAt" || 
        fieldName == "idiom\\:formerCustody" || 
        fieldName == "idiom\\:currentCustody" ||
        fieldName == "crm\\:P24i_changed_ownership_through" ||
        fieldName == "crm\\:P108i_was_produced_by" ||
        fieldName == "crm\\:P113i_was_removed_by" ||
        fieldName == "crm\\:P12i_was_present_at" ||
        fieldName == "crm\\:P16i_was_used_for" ||
        fieldName == "idiom\\:relatedActivity" ||
        fieldName == "idiom\\:namingRelatedActivity")

            query = 'SELECT ?result ?objectType WHERE { GRAPH <' + uri + '> { ?tgObject idiom:activityTitle ?result.}}'

    if(fieldName =="crm\\:P46_is_composed_of")

            query = 'SELECT ?result WHERE { GRAPH <' + uri + '> { ?tgObject idiom:preferredTitle ?result.}}'

    if(
        fieldName == "dc\\:source" || 
        fieldName == "idiom\\:hasActor" || 
        fieldName == "crm\\:P17_was_motivated_by" || 
        fieldName == "idiom\\:producer" ||
        fieldName == "idiom\\:relationshipGrandchild" ||
        fieldName == "idiom\\:relationshipSibling" ||
        fieldName == "idiom\\:relationshipSpouse" ||
        fieldName == "idiom\\:relationshipDescendant" ||
        fieldName == "idiom\\:relationshipDivineTutelary" ||
        fieldName == "idiom\\:relationshipRelation" ||
        fieldName == "idiom\\:relationshipChild")

            query = 'SELECT ?result WHERE { GRAPH <' + uri + '> { ?tgObject idiom:prefActorAppellation ?epiActorNameRef. ?epiActorNameRef idiom:actorName ?result.}}'

    if(
       fieldName == "crm\\:P22_transferred_title_to" || 
       fieldName == "crm\\:P23_transferred_title_from" || 
       fieldName == "idiom\\:custodian" || 
       fieldName == "idiom\\:explorer")


            query = 'SELECT ?result WHERE {{ GRAPH <' + uri + '> { ?tgObject schema:familyName ?familyName. ?tgObject schema:givenName ?givenName. BIND((CONCAT(STR(?familyName), STR(", "), STR(?givenName))) AS ?result) }} UNION { GRAPH <' + uri + '> { ?tgObject schema:name ?result.}}}'

    if(fieldName == "crm\\:P107i_is_former_or_current_member_of")
            query = 'SELECT ?result WHERE {{ GRAPH <' + uri + '> { ?tgObject idiom:prefActorAppellation ?epiGroupNameRef. ?epiGroupNameRef idiom:actorName ?result.}} UNION { GRAPH <' + uri + '> { ?tgObject schema:name ?result.}}}'

    if( 
       fieldName == "crm_P42\\:assigned" ||
       fieldName == "idiom\\:orientationOfArtefact" ||
       fieldName == "idiom\\:conditionType" ||
       fieldName == "idiom\\:actorNameType" ||
       fieldName == "crm\\:P126_employed" ||
       fieldName == "idiom\\:P14_1_in_the_role_of" ||
       fieldName == "idiom\\:groupType" ||
       fieldName == "idiom\\:placeType" ||
       fieldName == "crm\\:P32_used_general_technique" ||
       fieldName == "idiom\\:hasShapeType" ||
       fieldName == "idiom\\:activityType" ||
       fieldName == "idiom\\:profession")
         vocabularyRequest = true
         if(fieldName == "crm\\:P42_assigned")
            vocabulary = "artefacttype"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "idiom\\:orientationOfArtefact")
            vocabulary = "artefactorientation"
            console.log "vocabulary: " + vocabulary 
         if(fieldName == "idiom\\:conditionType")
            vocabulary = "conditiontype"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "idiom\\:actorNameType")
            vocabulary = "actorappellationtype"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "crm\\:P126_employed")
            vocabulary = "material"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "idiom\\:P14_1_in_the_role_of" || modalToLoad == "idiom_groupType" || modalToLoad == "idiom_profession")
            vocabulary = "grouptypeactorrole"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "idiom\\:placeType")
            vocabulary = "placetype"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "crm\\:P32_used_general_technique")
            vocabulary = "technique"
            console.log "vocabulary: " + vocabulary
         if(fieldName == "idiom\\:hasShapeType")
            vocabulary = "artefactshapetype"
            console.log "vocabulary: " + vocabulary 
         if(fieldName == "idiom\\:activityType")
            vocabulary = "activitytype"
            console.log "vocabulary: " + vocabulary
         
         query = 'SELECT DISTINCT *  WHERE { <' + uri + '> skos:prefLabel ?result.}'

    request = {
      'query' : queryPrefixes + "\n" + query
    }
    if vocabularyRequest == true
      url = sparqlEndpoint
    else
      url = sparqlEndpoint
    console.log "query: " + uri + " || " + query
    $.ajax(
        type: 'GET',
        url: url,
        cache: false,
        dataType: "json",
        data: request,
        cache: false
    )
    .done((data) ->
        console.log "tada"
        results = data['results']['bindings']       
        for result in results        
               resultDisp = result['result']['value']
           
               $this.children().children().first().before("<strong>" + resultDisp + "</strong><br/>")         
     )

#############
## Digilib ##
#############

getImageInsteadOfUri = (uri, $this, imageUriRequest) ->
 
    if imageUriRequest == false
      digilib = '<img src="https://textgridlab.org/1.0/digilib/rest/IIIF/' + uri + ';sid=' + tgSID + '/full/,100/0/native.jpg" alt=""/>'
      $this.children().children().first().next().after(digilib)
    else
      
      query = "SELECT ?graph ?graphNumber WHERE { GRAPH <" + uri + "> { ?tgObject idiomcat:hasDigitalImage ?graph. ?tgObject idiomcat:graphNumber ?graphNumber. }}"

      request = {
        'query' : queryPrefixes + "\n" + query
      }
      url = sparqlEndpoint
      $.ajax(
          type: 'GET',
          url: url,
          cache: false,
          dataType: "json",
          data: request,
          cache: false,
          async: false
      )
      .done((data) ->
          results = data['results']['bindings']       
          for result in results        
                 resultDisp = result['graph']['value']
                 graphNr = result['graphNumber']['value']
                 digilib = '<img src="https://textgridlab.org/1.0/digilib/rest/IIIF/' + resultDisp + ';sid=' + tgSID + '/full/,100/0/native.jpg" alt=""/>'            
                 $this.children().children().first().before(digilib + " <strong>" + graphNr + "</strong> | ")
       )

