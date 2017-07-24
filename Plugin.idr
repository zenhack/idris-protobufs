import BasicTypes
import Descriptor
%access public export
mutual
    record Version where
      constructor MkVersion
      major : Maybe Int32
      minor : Maybe Int32
      patch : Maybe Int32
      suffix : Maybe String

    record CodeGeneratorRequest where
      constructor MkCodeGeneratorRequest
      fileToGenerate : List String
      parameter : Maybe String
      proto_file : List FileDescriptorProto
      compiler_version : Maybe Version

    namespace CodeGeneratorResponse
      record File_ where
        constructor MkFile_
        name : Maybe String
        insertionPoint : Maybe String
        content : Maybe String

    record CodeGeneratorResponse where
      constructor MkCodeGeneratorResponse
      error : Maybe String
      file : List File_
