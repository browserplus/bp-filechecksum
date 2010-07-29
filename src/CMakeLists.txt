#####
# A CMake build file for the ruby filechecksum service which 
# calculates md5 sums for files.
# 
# Author: Gordon Durand
# (c) Yahoo 2010, all rights reserved
#####

CMAKE_MINIMUM_REQUIRED(VERSION 2.6) 

# looser syntax
SET(CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS 1)

SET(serviceName FileChecksum)

SET(SCRIPT_FILE FileChecksum.rb)

# Name our project
PROJECT(${serviceName}Ruby)

# desired output directory
SET (outputDir "${CMAKE_CURRENT_BINARY_DIR}/${serviceName}")

# build up the service dir
FILE(MAKE_DIRECTORY ${outputDir})

CONFIGURE_FILE("${CMAKE_CURRENT_SOURCE_DIR}/manifest.json"
               "${outputDir}/manifest.json")  

# ship all *.rb files
FILE(GLOB_RECURSE srcs RELATIVE "${CMAKE_CURRENT_SOURCE_DIR}" "*.rb")

SET(allDeps)

FOREACH(src ${srcs})
  SET(mySrc "${CMAKE_CURRENT_SOURCE_DIR}/${src}")
  SET(myDst "${outputDir}/${src}")

  ADD_CUSTOM_COMMAND(
    OUTPUT ${myDst}
    DEPENDS ${mySrc}		  
    COMMAND ${CMAKE_COMMAND} -E copy_if_different ${mySrc} ${myDst}
  )
  SET(allDeps ${allDeps} ${myDst})
ENDFOREACH()

ADD_CUSTOM_TARGET(${serviceName} ALL DEPENDS ${allDeps})

# a custom step to build latest externals
SET (pathToExtBuildRb "${CMAKE_CURRENT_SOURCE_DIR}/../external/build.rb")
ADD_CUSTOM_TARGET(
    BuildExternals ALL
    COMMAND ruby ${pathToExtBuildRb}
    COMMENT "Build 3rd party dependencies")
ADD_DEPENDENCIES( ${serviceName} BuildExternals )
