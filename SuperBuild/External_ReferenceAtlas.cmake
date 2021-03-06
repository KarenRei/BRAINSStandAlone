#
# ReferenceAtlas is a reference set of prior-probabilities and atlas images.
#
if(DEFINED ReferenceAtlas_DIR AND NOT EXISTS ${ReferenceAtlas_DIR})
  message(FATAL_ERROR "ReferenceAtlas_DIR variable is defined but corresponds to non-existing directory")
endif()


if(NOT DEFINED ReferenceAtlas_DIR)
  set(ATLAS_VERSION 20110607)
  set(ATLAS_URL http://www.psychiatry.uiowa.edu/users/hjohnson/ftp/Atlas_${ATLAS_VERSION}.tar.gz)
  set(ATLAS_NAME Atlas/Atlas_${ATLAS_VERSION})

  set(ReferenceAtlas_DEPEND ReferenceAtlas_${ATLAS_VERSION} )
  set(proj ReferenceAtlas_${ATLAS_VERSION})
  ExternalProject_add(${proj}
    URL ${ATLAS_URL}
    SOURCE_DIR ${proj}
    BINARY_DIR ${proj}-build
    UPDATE_COMMAND ""
    CMAKE_GENERATOR ${gen}
    CMAKE_ARGS  ${LOCAL_CMAKE_BUILD_OPTIONS}
    --no-warn-unused-cli
    ${ep_common_args}
    -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
    -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
    -DCMAKE_CXX_COMPILER_ARG1:STRING=${CMAKE_CXX_COMPILER_ARG1}
    -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
    -DCMAKE_C_COMPILER_ARG1:STRING=${CMAKE_C_COMPILER_ARG1}
    -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
    -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
    -DCMAKE_C_FLAGS_RELEASE:STRING=${CMAKE_C_FLAGS_RELEASE}
    -DCMAKE_C_FLAGS_DEBUG:STRING=${CMAKE_C_FLAGS_DEBUG}
    -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
    -DCMAKE_CXX_FLAGS_RELEASE:STRING=${CMAKE_CXX_FLAGS_RELEASE}
    -DCMAKE_CXX_FLAGS_DEBUG:STRING=${CMAKE_CXX_FLAGS_DEBUG}
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
    -DReferenceAtlas_XML_DIR:PATH=${${CMAKE_PROJECT_NAME}_RUNTIME_DIR}
    -DATLAS_VERSION:STRING=${ATLAS_VERSION}
    )
  set(ReferenceAtlas_DIR ${proj}-build)

endif(NOT DEFINED ReferenceAtlas_DIR)
