cmake_minimum_required (VERSION 2.8.8)

project (AgeGender)

find_package(Caffe)
MESSAGE( STATUS "Caffe_INCLUDE_DIRS:         " ${Caffe_INCLUDE_DIRS} )
MESSAGE( STATUS "Caffe_INCLUDE_DIR:         " ${Caffe_INCLUDE_DIR} )
MESSAGE( STATUS "Caffe_LIBRARIES:         " ${Caffe_LIBRARIES} )
MESSAGE( STATUS "Caffe_DEFINITIONS:         " ${Caffe_DEFINITIONS} )

include_directories(${Caffe_INCLUDE_DIR})
add_definitions(${Caffe_DEFINITIONS})    # ex. -DCPU_ONLY

set (AGE_GENDER_SRC
	${CMAKE_CURRENT_LIST_DIR}/AgeNet.cpp
    )
foreach(src_file IN LISTS AGE_GENDER_SRC)
    string(REGEX REPLACE .cpp .h hdr_file ${src_file})
    list(APPEND AGE_GENDER_HDR ${hdr_file})
endforeach(src_file IN LISTS AGE_GENDER_SRC)

# SOURCE_GROUP(AgeNet
             # FILES
             # ${AGE_GENDER_SRC}
             # ${AGE_GENDER_HDR})

add_executable(AgeGenderTest ${AGE_GENDER_SRC} ${AGE_GENDER_HDR} ${CMAKE_CURRENT_LIST_DIR}/main.cpp)

target_link_libraries(AgeGenderTest ${Caffe_LIBRARIES})
#set_property(TARGET AgeGenderTest PROPERTY FOLDER ${ALGORITHMS_FOLDER_NAME})	
	