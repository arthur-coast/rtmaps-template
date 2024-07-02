// **********************************************************
//      2024 : Arthur JEULIN
//      Copyright (c) Coast Autonomous 
//      Created by Arthur JEULIN on 07/05/2024.
// **********************************************************
//
// Module : To be define
//

#if defined(_MSC_VER) && (_MSC_VER >= 1200)
# pragma once
#endif // defined(_MSC_VER) && (_MSC_VER >= 1200)

#ifndef MAPS_TEMPLATE_H
#define MAPS_TEMPLATE_H

//#define __IPL_H__
#include <maps.hpp>
// Includes the MAPS::InputReader class and its dependencies
#include <maps/input_reader/maps_input_reader.hpp>

// Declares a new MAPSComponent child class
class MAPS_TEMPLATE : public MAPSComponent 
{
	// Use standard header definition macro
	MAPS_COMPONENT_STANDARD_HEADER_CODE(MAPS_TEMPLATE)
	

private :
   // Declare an input reader
  std::unique_ptr<MAPS::InputReader> _inputReader;
  
	int _log_destination;
	  
  /**
   * IL faut toujours MAPSTimestamp ts en premier argument de la callback.
   * Sinon erreur de compilation
   */
  void ProcessData(MAPSTimestamp ts, const MAPS::InputElt<double> input);
};

#endif /*MAPS_TEMPLATE_H*/