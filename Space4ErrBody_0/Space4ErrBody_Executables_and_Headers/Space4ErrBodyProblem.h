/*    Copyright (c) 2010-2017, Delft University of Technology
 *    All rigths reserved
 *
 *    This file is part of the Tudat. Redistribution and use in source and
 *    binary forms, with or without modification, are permitted exclusively
 *    under the terms of the Modified BSD license. You should have received
 *    a copy of the license with this file. If not, please or visit:
 *    http://tudat.tudelft.nl/LICENSE.
 */

#ifndef SPACE4ERRBODY_HPP
#define SPACE4ERRBODY_HPP

#include <utility>
#include <vector>
#include <limits>


#include "pagmo/island.hpp"
#include "pagmo/io.hpp"
#include "pagmo/serialization.hpp"
#include "pagmo/problem.hpp"
#include "pagmo/types.hpp"

#include <Tudat/SimulationSetup/EnvironmentSetup/body.h>
#include <Tudat/SimulationSetup/tudatSimulationHeader.h>
#include <Tudat/SimulationSetup/PropagationSetup/propagationTerminationSettings.h>
#include <Tudat/SimulationSetup/PropagationSetup/propagationSettings.h>

using namespace pagmo;
//using namespace pagmo::problem;

//! Define the problem PaGMO-style
struct Space4ErrBodyProblem {

    //! Empty constructor
    Space4ErrBodyProblem( ) { }

    //! Constructor.
    Space4ErrBodyProblem( const std::vector< std::vector< double > > &bounds,
                   const std::string &problem_name,
                   const std::string &vehicleName,
                   const std::vector< std::string > &parameterList_Ascent,
                   const std::vector< double > &parameterBounds_Ascent,
                   const std::vector< std::string > &parameterList_Descent,
                   const std::vector< double > &parameterBounds_Descent,
                   const std::vector< double > &vehicleParameterValues,
                   const std::vector< std::string > &aeroCoeffFileList,
                   const std::vector< double > &simulation_settingsValues,
                   const std::vector< double > &initialConditionsValues,
                   const std::vector< double > &terminationConditionsValues,
                   const std::vector< double > &output_settingsValues,
                   const std::string &outputSubFolder,
                   const Eigen::Vector6d &EntryState_spherical,
                   const std::vector< std::string > &bodiesWithMassToPropagate,
                   const std::vector< std::string > &centralBodies,
                   const std::vector< std::string > &bodiesToIntegrate,
                   const std::map< std::string, std::pair < double, double > > &Bounds_Ascent,
                   const std::map< std::string, std::pair < double, double > > &Bounds_Descent,
                   const tudat::simulation_setup::NamedBodyMap& bodyMap,
                   const tudat::basic_astrodynamics::AccelerationMap &accelerationsMap,
                   const std::shared_ptr< tudat::ephemerides::RotationalEphemeris > &earthRotationalEphemeris,
                   const std::shared_ptr< tudat::propagators::DependentVariableSaveSettings > &dependentVariablesToSave,
                          const std::shared_ptr< tudat::propagators::PropagationTerminationSettings > &terminationSettings_Ascent,
                          const std::shared_ptr< tudat::propagators::PropagationTerminationSettings > &terminationSettings_Descent,
                   const std::map< std::string, std::shared_ptr< tudat::basic_astrodynamics::MassRateModel > > &massRateModels,
                   const std::shared_ptr< tudat::propagators::SingleArcPropagatorSettings< double > > &massPropagatorSettings_Ascent);

    //! Calculate the fitness as a function of the parameter vector input_data
    std::vector< double > fitness( const std::vector< double >  &x ) const;

    //! Retrieve the allowable limits of the parameters to vary: pair
    //! containing minima and maxima of parameter values
    std::pair< std::vector< double >, std::vector< double > > get_bounds() const;

    //! Retrieve the name of the problem
    std::string get_name( ) const;

    std::vector< double >::size_type get_nobj() const
    {
        return 11u;
    }
    std::vector< double >::size_type get_nec() const
    {
        return 0u;
    }

    //! Serialization function for Pagmo compatibility
    template < typename Archive >
    void serialize( Archive &ar )
    {
        ar( problemBounds_ );
    }

private:

    const std::vector< std::vector< double > > problemBounds_;
    const std::string problem_name_;
    const std::string vehicleName_;
    const std::vector< std::string > parameterList_Ascent_;
    const std::vector< double > parameterBounds_Ascent_;
    const std::vector< std::string > parameterList_Descent_;
    const std::vector< double > parameterBounds_Descent_;
    const std::vector< double > vehicleParameterValues_;
    const std::vector< std::string > aeroCoeffFileList_;
    const std::vector< double > simulation_settingsValues_;
    const std::vector< double > initialConditionsValues_;
    const std::vector< double > terminationConditionsValues_;
    const std::vector< double > output_settingsValues_;
    const std::string outputSubFolder_;
    const Eigen::Vector6d EntryState_spherical_;
    const std::vector< std::string > bodiesWithMassToPropagate_;
    const std::vector< std::string > centralBodies_;
    const std::vector< std::string > bodiesToIntegrate_;
    const std::map< std::string, std::pair < double, double > > Bounds_Ascent_;
    const std::map< std::string, std::pair < double, double > > Bounds_Descent_;
    const tudat::simulation_setup::NamedBodyMap bodyMap_;
    const tudat::basic_astrodynamics::AccelerationMap accelerationsMap_;
    const std::shared_ptr< tudat::ephemerides::RotationalEphemeris > earthRotationalEphemeris_;
    const std::shared_ptr< tudat::propagators::DependentVariableSaveSettings > dependentVariablesToSave_;
    const std::shared_ptr< tudat::propagators::PropagationTerminationSettings > terminationSettings_Ascent_;
    const std::shared_ptr< tudat::propagators::PropagationTerminationSettings > terminationSettings_Descent_;
    const std::map< std::string, std::shared_ptr< tudat::basic_astrodynamics::MassRateModel > > massRateModels_;
    const std::shared_ptr< tudat::propagators::SingleArcPropagatorSettings< double > > massPropagatorSettings_Ascent_;
};

//PAGMO_REGISTER_PROBLEM(pagmo::Space4ErrBody)

#endif // SPACE4ERRBODY_OPTIMIZATION_HPP