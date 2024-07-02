// **********************************************************
//      2024 : Arthur JEULIN
//      Copyright (c) Coast Autonomous 
//      Created by Arthur JEULIN on 07/05/2024.
// **********************************************************
//
// Module : To be define
//

#include "maps_template.h"	// Includes the header of this component

// Use the macros to declare the inputs
MAPS_BEGIN_INPUTS_DEFINITION(MAPS_TEMPLATE)
    MAPS_INPUT("Input", MAPS::FilterFloat64,MAPS::FifoReader) 
MAPS_END_INPUTS_DEFINITION

// Use the macros to declare the outputs
MAPS_BEGIN_OUTPUTS_DEFINITION(MAPS_TEMPLATE)
    MAPS_OUTPUT("Output", MAPS::Float64, NULL,NULL,1)
MAPS_END_OUTPUTS_DEFINITION

// Use the macros to declare the properties
MAPS_BEGIN_PROPERTIES_DEFINITION(MAPS_TEMPLATE)
    MAPS_PROPERTY_ENUM("LogDestination", "Log|Console",0, false, false)
    MAPS_PROPERTY("LoggingPath", "C:/dev/log", false, false)
MAPS_END_PROPERTIES_DEFINITION

// Use the macros to declare the actions
MAPS_BEGIN_ACTIONS_DEFINITION(MAPS_TEMPLATE)
MAPS_END_ACTIONS_DEFINITION


// Use the macros to declare this component (SaveRFID) behaviour
MAPS_COMPONENT_DEFINITION(MAPS_TEMPLATE,"save_rfid","1.0",128,
			  MAPS::Threaded,MAPS::Threaded,
			  -1, // Nb of inputs. Leave -1 to use the number of declared input definitions
			  -1, // Nb of outputs. Leave -1 to use the number of declared output definitions
			  -1, // Nb of properties. Leave -1 to use the number of declared property definitions
			  -1) // Nb of actions. Leave -1 to use the number of declared action definitions

//Initialization: Birth() will be called once at diagram execution startup.			  
void MAPS_TEMPLATE::Birth()
{   

  _inputReader = MAPS::MakeInputReader::Triggered(
    this,
    // The input reader will first wait for data on this input
    Input("Input"),

    // TriggerKind::DataInput means that we want to access the "value" of the data of the trigger input in the callback.
    // In this case, the trigger input MUST be added to the list of data inputs (see the next argument)
    MAPS::InputReaderOption::Triggered::TriggerKind::DataInput,
    // SamplingBehavior::WaitForAllInputs means that the data callback will be called
    // only if there are data samples on all inputs
    MAPS::InputReaderOption::Triggered::SamplingBehavior::WaitForAllInputs,

    MAPS::MakeArray(&Input("Input")),

    // This callback will be called when data was read from the trigger AND the data inputs.
    &MAPS_TEMPLATE::ProcessData
  );

}


void MAPS_TEMPLATE::Core() 
{ 
  _inputReader->Read();
}

void MAPS_TEMPLATE::Death()
{
  _inputReader.reset();
}

void MAPS_TEMPLATE::ProcessData(MAPSTimestamp ts, const MAPS::InputElt<double> input)
{
 
  MAPS::OutputGuard<double> outGuard{this, Output("oRFID")};
  outGuard.Data() = input.Data() * 2;
  // As always, set the VectorSize and the Timestamp
  outGuard.VectorSize() = 1;
  // outGuard.VectorSize() = (MAPSInt32)output_string.size();
  outGuard.Timestamp() = MAPS::CurrentTime(); 
}
