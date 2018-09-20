#include "Space4ErrBody.h"
#include "updateGuidance.h"

#include <Tudat/Mathematics/BasicMathematics/mathematicalConstants.h>
#include <Tudat/Astrodynamics/BasicAstrodynamics/unitConversions.h>
#include <Tudat/Astrodynamics/Aerodynamics/aerodynamics.h>
#include <Tudat/Astrodynamics/Aerodynamics/flightConditions.h>
#include <Tudat/Astrodynamics/Aerodynamics/aerodynamicGuidance.h>
#include <Tudat/SimulationSetup/tudatSimulationHeader.h>

namespace tudat
{

namespace aerodynamics
{


//! Trying to implement a simple aerodynamic guidance. Initially taken from the
//! TUDAT website.
//! http://tudat.tudelft.nl/tutorials/tudatFeatures/accelerationSetup/aerodynamicGuidance.html#FlightConditions
void FlightConditionsBasedAerodynamicGuidance::updateGuidance( const double currentTime )
{

    //using namespace tudat;
    //using namespace tudat::aerodynamics;
    //using namespace tudat::basic_mathematics;
   // using namespace tudat::mathematical_constants;
   // using namespace tudat::simulation_setup;
   // using namespace tudat::unit_conversions;


    // Define aerodynamic coefficient interface/flight conditions (typically retrieved from body map; may also be a member variable)
    //boost::shared_ptr< aerodynamics::AerodynamicCoefficientInterface > coefficientInterface_->getAerodynamicCoefficientInterface( );
  //  boost::shared_ptr< aerodynamics::FlightConditions > FlightConditions_;//->getFlightConditions( );
/*
    // Compute angles of attack and sideslip
    //currentAngleOfAttack_ = ...
    //currentAngleOfSideslip_ = ...

   // double currentFlightPathAngle = flightConditions_->getAerodynamicAngleCalculator( )->getAerodynamicAngle( reference_frames::flight_path_angle );

*/

    currentAngleOfAttack_ = unit_conversions::convertDegreesToRadians( 35.0 );
    currentBankAngle_ = unit_conversions::convertDegreesToRadians( 35.0 );
    /*
    if( FlightConditions_->getCurrentAltitude( ) > 60.0E3 )
    {
        currentAngleOfAttack_ = unit_conversions::convertDegreesToRadians( 35.0 ) ;
    }
    else if( FlightConditions_->getCurrentAltitude( ) < 25.0E3 )
    {
        currentAngleOfAttack_ = unit_conversions::convertDegreesToRadians( 5.0 ) ;
    }
    else
    {
        currentAngleOfAttack_ = unit_conversions::convertDegreesToRadians(
                    ( 5.0 + 30.0 * ( FlightConditions_->getCurrentAltitude( ) - 25.0E3 ) / 35.0E3 ) );
    }

    currentAngleOfSideslip_ = 0.0;

    if( FlightConditions_->getCurrentMachNumber( ) > 8 )
    //   if( FlightConditions_->getCurrentAltitude( ) < 80.0E3 )
    {
        currentBankAngle_ = unit_conversions::convertDegreesToRadians( 10.0 ) ;
    }
    else if( ( FlightConditions_->getCurrentMachNumber( ) > 3) && ( FlightConditions_->getCurrentMachNumber( ) < 8) )
    {
        currentAngleOfAttack_ = unit_conversions::convertDegreesToRadians( 45.0 ) ;
    }
    else
    {
        currentBankAngle_ = unit_conversions::convertDegreesToRadians( 85.0 );
    }
*/
        /*
        // Define input to aerodynamic coefficients: take care of order of input (this depends on how the coefficients are created)!
        std::vector< double > currentAerodynamicCoefficientsInput_;
        currentAerodynamicCoefficientsInput_.push_back( currentAngleOfAttack_ );
        currentAerodynamicCoefficientsInput_.push_back( currentAngleOfSideslip_ );
        currentAerodynamicCoefficientsInput_.push_back( currentBankAngle_ );
        currentAerodynamicCoefficientsInput_.push_back( FlightConditions_->getCurrentMachNumber( ) );

        // Update and retrieve current aerodynamic coefficients
        coefficientInterface_->updateCurrentCoefficients( currentAerodynamicCoefficientsInput_ );
        Eigen::Vector3d currentAerodynamicCoefficients = coefficientInterface_->getCurrentForceCoefficients( );

        // Compute bank angle
        currentBankAngle_ =  some function of currentAerodynamicCoefficients

        */
}


} // namespace aerodynamics

} // namespace tudat
