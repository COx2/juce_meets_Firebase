juce_add_gui_app(AuthTest
    # VERSION ...                       # Set this if the app version is different to the project version
    # ICON_BIG ...                      # ICON_* arguments specify a path to an image file to use as an icon
    # ICON_SMALL ...
    # DOCUMENT_EXTENSIONS ...           # Specify file extensions that should be associated with this app
    # COMPANY_NAME ...                  # Specify the name of the app's author
    PRODUCT_NAME "Auth Test")     # The name of the final executable, which can differ from the target name

juce_generate_juce_header(AuthTest)

target_sources(AuthTest
    PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/Main.cpp
    ${CMAKE_CURRENT_LIST_DIR}/MainComponent.cpp
    ${CMAKE_CURRENT_LIST_DIR}/MainComponent.h
)

target_compile_definitions(AuthTest
    PRIVATE
        # JUCE_WEB_BROWSER and JUCE_USE_CURL would be on by default, but you might not need them.
        JUCE_WEB_BROWSER=0  # If you remove this, add `NEEDS_WEB_BROWSER TRUE` to the `juce_add_gui_app` call
        JUCE_USE_CURL=0     # If you remove this, add `NEEDS_CURL TRUE` to the `juce_add_gui_app` call
        JUCE_APPLICATION_NAME_STRING="$<TARGET_PROPERTY:AuthTest,JUCE_PRODUCT_NAME>"
        JUCE_APPLICATION_VERSION_STRING="$<TARGET_PROPERTY:AuthTest,JUCE_VERSION>"
        JUCE_DISPLAY_SPLASH_SCREEN=0
)

target_compile_features(AuthTest
    PRIVATE 
        cxx_std_17
)

target_compile_options(AuthTest
    PRIVATE
        $<$<CXX_COMPILER_ID:MSVC>:/source-charset:utf-8 /permissive->
        $<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Werror=return-type>
)

# The Firebase C++ library `firebase_app` is required,
# and it must always be listed last.

# Add the Firebase SDKs for the products you want to use in your app
# For example, to use Firebase Authentication and Firebase Realtime Database
set(firebase_libs firebase_auth firebase_app)

target_link_libraries(AuthTest
    PRIVATE
        juce::juce_gui_extra
        juce::juce_cryptography
        "${firebase_libs}"
        ws2_32
        crypt32
    PUBLIC
        juce::juce_recommended_config_flags
        juce::juce_recommended_lto_flags
        juce::juce_recommended_warning_flags)
