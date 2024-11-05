package org.kurron.hard.parts.sbe;

import org.junit.platform.suite.api.IncludeEngines;
import org.junit.platform.suite.api.SelectClasspathResource;
import org.junit.platform.suite.api.Suite;

@Suite
@IncludeEngines("cucumber")
@SelectClasspathResource("features/purchase-item.feature")
public class SpecificationByExampleIT {
}
