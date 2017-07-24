import BasicTypes

%access public export
mutual

    -- vim : set ts=2 sw=2 et :
    record FileDescriptorSet where
      constructor MkFileDescriptorSet
      file : List FileDescriptorProto

    record FileDescriptorProto where
      constructor MkFileDescriptorProto
      name : Maybe String
      package : Maybe String
      dependency : List String
      publicDependency : List Int32
      weakDependency : List Int32
      recordType : List DescriptorProto
      enumType : List EnumDescriptorProto
      service : List ServiceDescriptorProto
      extension : List FieldDescriptorProto
      options : Maybe FileOptions
      sourceCodeInfo : Maybe SourceCodeInfo
      syntax_ : Maybe String

    namespace DescriptorProto
      record ExtensionRange where
        constructor MkExtensionRange
        start : Maybe Int32
        end : Maybe Int32
      record ReservedRange where
        constructor MkReservedRange
        start : Maybe Int32
        end : Maybe Int32

    record DescriptorProto where
      constructor MkDescriptorProto
      name : Maybe String
      field : List FieldDescriptorProto
      extension : List FieldDescriptorProto
      nestedType : List DescriptorProto
      enumType : List EnumDescriptorProto

      extensionRange : List ExtensionRange
      oneofDecl : List OneofDescriptorProto
      options : Maybe MessageOptions

      reservedRange : List ReservedRange
      reservedName : List String

    namespace FieldDescriptorProto
      Type_ : Type
      Type_ = Int
      namespace Type_
        DOUBLE         : Type_
        FLOAT          : Type_
        INT64          : Type_
        UINT64         : Type_
        INT32          : Type_
        FIXED64        : Type_
        FIXED32        : Type_
        BOOL           : Type_
        STRING         : Type_
        GROUP          : Type_
        MESSAGE        : Type_
        BYTES          : Type_
        UINT32         : Type_
        ENUM           : Type_
        SFIXED32       : Type_
        SFIXED64       : Type_
        SINT32         : Type_
        SINT64         : Type_
        DOUBLE         = 1
        FLOAT          = 2
        INT64          = 3
        UINT64         = 4
        INT32          = 5
        FIXED64        = 6
        FIXED32        = 7
        BOOL           = 8
        STRING         = 9
        GROUP          = 10
        MESSAGE        = 11
        BYTES          = 12
        UINT32         = 13
        ENUM           = 14
        SFIXED32       = 15
        SFIXED64       = 16
        SINT32         = 17
        SINT64         = 18
      Label : Type
      Label = Int
      namespace Label
        OPTIONAL      : Label
        REQUIRED      : Label
        REPEATED      : Label
        OPTIONAL      = 1
        REQUIRED      = 2
        REPEATED      = 3
    record FieldDescriptorProto where
      constructor MkFieldDescriptorProto
      name : Maybe String
      number : Maybe Int32
      label : Maybe Label
      type : Maybe Type
      typeName : Maybe String
      extendee : Maybe String
      defaultValue : Maybe String
      oneofIndex : Maybe Int32
      jsonName : Maybe String
      options : Maybe FieldOptions

    record OneofDescriptorProto where
      constructor MkOneofDescriptorProto
      name : Maybe String
      options : Maybe OneofOptions

    record EnumDescriptorProto where
      constructor MkEnumDescriptorProto
      name : Maybe String
      value : List EnumValueDescriptorProto
      options : Maybe EnumOptions

    record EnumValueDescriptorProto where
      constructor MkEnumValueDescriptorProto
      name : Maybe String
      number : Maybe Int32
      options : Maybe EnumValueOptions

    record ServiceDescriptorProto where
      constructor MkServiceDescriptorProto
      name : Maybe String
      method : List MethodDescriptorProto
      options : Maybe ServiceOptions

    record MethodDescriptorProto where
      constructor MkMethodDescriptorProto
      name : Maybe String
      inputType : Maybe String
      outputType : Maybe String
      options : Maybe MethodOptions
      clientStreaming : Maybe Bool
      serverStreaming : Maybe Bool

    namespace FileOptions
        OptimizeMode : Type
        OptimizeMode = Int

        SPEED : OptimizeMode
        CODE_SIZE : OptimizeMode
        LITE_RUNTIME : OptimizeMode
        SPEED = 1
        CODE_SIZE = 2
        LITE_RUNTIME = 3
    record FileOptions where
      constructor MkFileOptions
      javaPackage : Maybe String
      javaOuterClassname : Maybe String
      javaMultipleFiles : Maybe Bool
      javaGenerateEqualsAndHash : Maybe Bool
      javaStringCheckUtf8 : Maybe Bool

      optimizeFor : Maybe OptimizeMode
      goPackage : Maybe String
      ccGenericServices : Maybe Bool
      javaGenericServices : Maybe Bool
      pyGenericServices : Maybe Bool
      phpGenericServices : Maybe Bool
      deprecated : Maybe Bool
      ccEnableArenas : Maybe Bool
      objcClassPrefix : Maybe String
      csharpNamespace : Maybe String
      swiftPrefix : Maybe String
      phpClassPrefix : Maybe String
      phpNamespace : Maybe String
      uninterpretedOption : List UninterpretedOption

    record MessageOptions where
      constructor MkMessageOptions
      recordSetWireFormat : Maybe Bool
      noStandardDescriptorAccessor : Maybe Bool
      deprecated : Maybe Bool
      mapEntry : Maybe Bool
      uninterpretedOption : List UninterpretedOption

    namespace FieldOptions
        CType : Type
        CType = Int

        STRING : CType
        CORD : CType
        STRING_PIECE : CType
        STRING = 0
        CORD = 1
        STRING_PIECE = 2

        JSType : Type
        JSType = Int
        JS_NORMAL : JSType
        JS_STRING : JSType
        JS_NUMBER : JSType
        JS_NORMAL = 0
        JS_STRING = 1
        JS_NUMBER = 2

    record FieldOptions where
      constructor MkFieldOptions
      ctype : Maybe CType

      packed : Maybe Bool
      jstype : Maybe JSType

      lazy : Maybe Bool
      deprecated : Maybe Bool
      weak : Maybe Bool
      uninterpretedOption : List UninterpretedOption

    record OneofOptions where
      constructor MkOneofOptions
      uninterpretedOption : List UninterpretedOption

    record EnumOptions where
      constructor MkEnumOptions
      allowAlias : Maybe Bool
      deprecated : Maybe Bool
      uninterpretedOption : List UninterpretedOption

    record EnumValueOptions where
      constructor MkEnumValueOptions
      deprecated : Maybe Bool
      uninterpretedOption : List UninterpretedOption

    record ServiceOptions where
      constructor MkServiceOptions
      deprecated : Maybe Bool
      uninterpretedOption : List UninterpretedOption

    namespace MethodOptions
        IdempotencyLevel : Type
        IdempotencyLevel = Int

        IDEMPOTENCY_UNKNOWN : IdempotencyLevel
        NO_SIDE_EFFECTS     : IdempotencyLevel
        IDEMPOTENT          : IdempotencyLevel
        IDEMPOTENCY_UNKNOWN = 0
        NO_SIDE_EFFECTS     = 1
        IDEMPOTENT          = 2

    record MethodOptions where
      constructor MkMethodOptions
      deprecated : Maybe Bool

      idempotencyLevel : Maybe IdempotencyLevel
      uninterpretedOption : List UninterpretedOption

    namespace UninterpretedOption
      record NamePart where
        constructor MkNamePart
        namePart : String
        isExtension : Bool

    record UninterpretedOption where
      constructor MkUninterpretedOption
      name : List NamePart
      identifierValue : Maybe String
      positiveIntValue : Maybe Bits64
      negativeIntValue : Maybe Int64
      DoubleValue : Maybe Double
      StringValue : Maybe Bytes
      aggregateValue : Maybe String

    namespace SourceCodeInfo
      record Location where
        constructor MkLocation
        path : List Int32
        span : List Int32
        leadingComments : Maybe String
        trailingComments : Maybe String
        leadingDetachedComments : List String
    record SourceCodeInfo where
      constructor MkSourceCodeInfo
      location : List Location


    namespace GeneratedCodeInfo
      record Annotation where
        constructor MkAnnotation
        path : List Int32
        sourceFile : Maybe String
        begin : Maybe Int32
        end : Maybe Int32
    record GeneratedCodeInfo where
      constructor MkGeneratedCodeInfo
      annotation : List Annotation
