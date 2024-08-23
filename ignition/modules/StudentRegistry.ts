import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const StudentRegistryModule = buildModule("StudentRegistryModule", (m) => {
  const StudentRegistry = m.contract("StudentRegistry", [], {});

  return { StudentRegistry };
});

export default StudentRegistryModule;


