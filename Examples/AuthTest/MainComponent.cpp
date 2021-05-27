#include "MainComponent.h"

//==============================================================================
MainComponent::MainComponent()
{
    setSize(600, 400);

    firebase::AppOptions options;
    firebaseApp.reset(firebase::App::Create(options));

    std::unique_ptr<firebase::auth::Auth> auth_interface(firebase::auth::Auth::GetAuth(firebaseApp.get()));

    {
        firebase::Future<firebase::auth::User*> result =  auth_interface->CreateUserWithEmailAndPassword("", "");
    }

    {
        firebase::Future<firebase::auth::User*> result = auth_interface->SignInWithEmailAndPassword("", "");
    }

    {
        //firebase::Future<firebase::auth::User*> result = auth_interface->CreateUserWithEmailAndPasswordLastResult();

        //The lambda has the same signature as the callback function.
        //result.OnCompletion(
        //    [](const firebase::Future<firebase::auth::User*>& result, void* user_data) {
        //        // `user_data` is the same as &my_program_context, below.
        //        // Note that we can't capture this value in the [] because std::function
        //        // is not supported by our minimum compiler spec (which is pre C++11).
        //        MyProgramContext* program_context = static_cast<MyProgramContext*>(user_data);

        //        // Process create user result...
        //        (void)program_context;
        //    },
        //    &my_program_context);
    }
}

//==============================================================================
void MainComponent::paint(juce::Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll(getLookAndFeel().findColour(juce::ResizableWindow::backgroundColourId));

}

void MainComponent::resized()
{
    // This is called when the MainComponent is resized.
    // If you add any child components, this is where you should
    // update their positions.
}