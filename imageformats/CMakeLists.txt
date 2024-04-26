add_library(qpic MODULE
    main.cpp
    qpichandler.cpp qpichandler.h
)
target_link_libraries(qpic Qt6::Gui)
