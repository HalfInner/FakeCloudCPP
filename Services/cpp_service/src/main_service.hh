#pragma once

#include <iostream>
#include <memory>
// #include <boost/version.hpp>

#include "crow.h"

class MainService {
public:
    void run() { 
        // std::cout << "Boost version: " << BOOST_LIB_VERSION << std::endl;

        std::cout << "Amazing!\n";
        
        crow::SimpleApp app; 

        CROW_ROUTE(app, "/")([](){
            return "Hello world";
        });

        CROW_ROUTE(app, "/always")([](){
            return "I will alwyas wish you the best";
        });

        app.port(5555).multithreaded().run();
    }

private:
    // std::unique_ptr<crow::SimpleApp> app;
};