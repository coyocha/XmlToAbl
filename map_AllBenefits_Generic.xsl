<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
	xmlns:var="urn:var" xmlns:userCSharp="urn:userCSharp" xmlns:userJScript="urn:userJScript" exclude-result-prefixes="msxsl var userCSharp userJScript"
	version="1.0">
	<xsl:output method="xml" omit-xml-declaration="no" />
	<xsl:template match="/">
		<xsl:apply-templates select="AllBenefits" />
	</xsl:template>
	<xsl:template match="AllBenefits">
		<Generic>
			<xsl:for-each select="Header">
				<Header>
					<xsl:variable name="var:v1" select="userCSharp:SetFileFormat(string(FileFormat/text()),string(HDRFileFormat/text()))" />
					<HDRFileFormat>
						<xsl:value-of select="$var:v1" />
					</HDRFileFormat>
					<xsl:if test="UserID">
						<HDRUserID>
							<xsl:value-of select="UserID/text()" />
						</HDRUserID>
					</xsl:if>
					<xsl:if test="ReportKey">
						<HDRReportKey>
							<xsl:value-of select="ReportKey/text()" />
						</HDRReportKey>
					</xsl:if>
					<xsl:if test="JobKey">
						<HDRJobKey>
							<xsl:value-of select="JobKey/text()" />
						</HDRJobKey>
					</xsl:if>
					<xsl:if test="ClientKey">
						<HDRClientKey>
							<xsl:value-of select="ClientKey/text()" />
						</HDRClientKey>
					</xsl:if>
					<xsl:variable name="var:v2" select="userCSharp:SetProcessType(string(FileProcessType/text()),string(HDRFileProcessType/text()))" />
					<HDRFileProcessType>
						<xsl:value-of select="$var:v2" />
					</HDRFileProcessType>
					<xsl:variable name="var:v3" select="userCSharp:SetCN(string(HDRClientName/text()))" />
					<HDRClientName>
						<xsl:value-of select="$var:v3" />
					</HDRClientName>
					<xsl:if test="HDRRecordType">
						<HDRRecordType>
							<xsl:value-of select="HDRRecordType/text()" />
						</HDRRecordType>
					</xsl:if>
					<xsl:variable name="var:v4" select="userCSharp:SetFCD(string(HDRFileCreationDate/text()))" />
					<HDRFileCreationDate>
						<xsl:value-of select="$var:v4" />
					</HDRFileCreationDate>
					<xsl:if test="HDRFileVersionNumber">
						<HDRFileVersionNumber>
							<xsl:value-of select="HDRFileVersionNumber/text()" />
						</HDRFileVersionNumber>
					</xsl:if>
					<xsl:variable name="var:v5" select="userCSharp:SaveMIT(string(HDRMemberIDType/text()))" />
					<HDRMemberIdType>
						<xsl:value-of select="$var:v5" />
					</HDRMemberIdType>
					<xsl:if test="HDRFileSequenceNumber">
						<HDRFileSequenceNumber>
							<xsl:value-of select="HDRFileSequenceNumber/text()" />
						</HDRFileSequenceNumber>
					</xsl:if>
					<xsl:if test="HDRCodePage">
						<HDRCodePage>
							<xsl:value-of select="HDRCodePage/text()" />
						</HDRCodePage>
					</xsl:if>
					<xsl:variable name="var:v6" select="userCSharp:SetHDRLanguage(string(HDRLanguagePreference/text()))" />
					<HDRLanguagePreference>
						<xsl:value-of select="$var:v6" />
					</HDRLanguagePreference>
					<HDRExtraMemberIDIndicator>
						<xsl:text>00</xsl:text>
					</HDRExtraMemberIDIndicator>
				</Header>
			</xsl:for-each>
			<xsl:for-each select="Member">
				<Member>
					<xsl:variable name="var:v8" select="userCSharp:NumM (string(MContractNumber/text()))" />
					<MPolicyKey>
						<xsl:value-of select="$var:v8" />
					</MPolicyKey>
					<xsl:variable name="var:v9" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<MClassKey>
						<xsl:value-of select="$var:v9" />
					</MClassKey>
					<xsl:variable name="var:v10" select="userCSharp:CertStripZero_M(string(MCertificateNumber/text()))" />
					<xsl:variable name="var:v11" select="userCSharp:ID_M(string($var:v10))" />
					<MCertKey>
						<xsl:value-of select="$var:v11" />
					</MCertKey>
					<MClientNumber>
						<xsl:value-of select="$var:v9" />
					</MClientNumber>
					<MExtraMemberID>
						<xsl:value-of select="$var:v8" />
					</MExtraMemberID>
					<MMemberID>
						<xsl:value-of select="$var:v11" />
					</MMemberID>
					<xsl:if test="MRecordType">
						<MRecordType>
							<xsl:value-of select="MRecordType/text()" />
						</MRecordType>
					</xsl:if>
					<xsl:if test="MAction">
						<MAction>
							<xsl:value-of select="MAction/text()" />
						</MAction>
					</xsl:if>
					<xsl:if test="MEffectiveDate">
						<MEffectiveDate>
							<xsl:value-of select="MEffectiveDate/text()" />
						</MEffectiveDate>
					</xsl:if>
					<xsl:variable name="var:v13" select="userCSharp:FName(string(MFirstName/text()))" />
					<MFirstName>
						<xsl:value-of select="$var:v13" />
					</MFirstName>
					<MMiddleInitial>
						<xsl:value-of select="$var:v9" />
					</MMiddleInitial>
					<xsl:variable name="var:v14" select="userCSharp:LName(string(MLastName/text()))" />
					<MLastName>
						<xsl:value-of select="$var:v14" />
					</MLastName>
					<xsl:variable name="var:v15" select="userCSharp:DOB(string(MDateOfBirth/text()))" />
					<MDateOfBirth>
						<xsl:value-of select="$var:v15" />
					</MDateOfBirth>
					<xsl:variable name="var:v16" select="userCSharp:Gender(string(MGender/text()))" />
					<MGender>
						<xsl:value-of select="$var:v16" />
					</MGender>
					<xsl:variable name="var:v17" select="userCSharp:Lang(string(MLanguagePreference/text()))" />
					<MLanguagePreference>
						<xsl:value-of select="$var:v17" />
					</MLanguagePreference>
					<xsl:variable name="var:v18" select="userCSharp:Smoker(string(MSmokerStatus/text()))" />
					<MSmokerStatus>
						<xsl:value-of select="$var:v18" />
					</MSmokerStatus>
					<MCertificateNumber>
						<xsl:value-of select="$var:v10" />
					</MCertificateNumber>
					<xsl:variable name="var:v19" select="userCSharp:SIN(string(MSocialInsuranceNumber/text()))" />
					<MSocialInsuranceNumber>
						<xsl:value-of select="$var:v19" />
					</MSocialInsuranceNumber>
					<xsl:variable name="var:v20" select="userCSharp:EmpID(string(MEmployeeID/text()))" />
					<MPayrollEmployeeID>
						<xsl:value-of select="$var:v20" />
					</MPayrollEmployeeID>
					<xsl:variable name="var:v21" select="userCSharp:PNum(string(MPlanNumber/text()))" />
					<MPlanNumber>
						<xsl:value-of select="$var:v21" />
					</MPlanNumber>
					<xsl:variable name="var:v22" select="userCSharp:LNum(string(MLocationNumber/text()))" />
					<MLocationNumber>
						<xsl:value-of select="$var:v22" />
					</MLocationNumber>
					<xsl:variable name="var:v23" select="userCSharp:CNum(string(MClassNumber/text()))" />
					<MClassNumber>
						<xsl:value-of select="$var:v23" />
					</MClassNumber>
					<xsl:variable name="var:v24" select="userCSharp:G1(string(MMemberGrouping1/text()))" />
					<MBillTotalSort5Number>
						<xsl:value-of select="$var:v24" />
					</MBillTotalSort5Number>
					<xsl:variable name="var:v25" select="userCSharp:G2(string(MMemberGrouping2/text()))" />
					<MBillTotalSort6Number>
						<xsl:value-of select="$var:v25" />
					</MBillTotalSort6Number>
					<xsl:variable name="var:v26" select="userCSharp:G3(string(MMemberGrouping3/text()))" />
					<MBillTotalSort7Number>
						<xsl:value-of select="$var:v26" />
					</MBillTotalSort7Number>
					<xsl:variable name="var:v27" select="userCSharp:DofE(string(MDateOfEmployment/text()))" />
					<MDateOfEmployment>
						<xsl:value-of select="$var:v27" />
					</MDateOfEmployment>
					<xsl:variable name="var:v28" select="userCSharp:RP(string(MAction/text()),string(MResidenceProvinceCode/text()))" />
					<MResidenceProvinceCode>
						<xsl:value-of select="$var:v28" />
					</MResidenceProvinceCode>
					<xsl:variable name="var:v29" select="userCSharp:WP(string(MAction/text()),string(MWorkProvinceCode/text()))" />
					<MWorkProvinceCode>
						<xsl:value-of select="$var:v29" />
					</MWorkProvinceCode>
					<MFlexCreditsEffectiveDate>
						<xsl:value-of select="$var:v9" />
					</MFlexCreditsEffectiveDate>
					<MFlexCreditsAmount>
						<xsl:value-of select="$var:v9" />
					</MFlexCreditsAmount>
					<MOptionCreditsAmount>
						<xsl:value-of select="$var:v9" />
					</MOptionCreditsAmount>
					<MSupplementaryCreditsAmount>
						<xsl:value-of select="$var:v9" />
					</MSupplementaryCreditsAmount>
					<MMonthsOfService>
						<xsl:value-of select="$var:v9" />
					</MMonthsOfService>
					<MDaysPerWeek>
						<xsl:value-of select="$var:v9" />
					</MDaysPerWeek>
					<xsl:variable name="var:v30" select="userCSharp:RfT(string(MAction/text()),string(MReasonForTermination/text()))" />
					<MReasonForTermination>
						<xsl:value-of select="$var:v30" />
					</MReasonForTermination>
					<MDependentCount>
						<xsl:value-of select="$var:v9" />
					</MDependentCount>
					<MUserDefinedAmount>
						<xsl:value-of select="$var:v9" />
					</MUserDefinedAmount>
					<MTerminationDate>
						<xsl:value-of select="$var:v9" />
					</MTerminationDate>
					<MDefaultDependentTypeCode>
						<xsl:value-of select="MDefaultDependentTypeCode/text()" />
					</MDefaultDependentTypeCode>
					<MSalutation>
						<xsl:value-of select="$var:v9" />
					</MSalutation>
					<xsl:if test="MRetirementDate">
						<MRetirementDate>
							<xsl:value-of select="MRetirementDate/text()" />
						</MRetirementDate>
					</xsl:if>
					<xsl:variable name="var:v32" select="userCSharp:Occ(string(MOccupation/text()))" />
					<MOccupationCode>
						<xsl:value-of select="$var:v32" />
					</MOccupationCode>
					<xsl:variable name="var:v33" select="userCSharp:TaxExempt(string(MAction/text()),string(MTaxExempted/text()))" />
					<MTaxExemptionFlag>
						<xsl:value-of select="$var:v33" />
					</MTaxExemptionFlag>
					<xsl:if test="MDateOfDeath">
						<MDateOfDeath>
							<xsl:value-of select="MDateOfDeath/text()" />
						</MDateOfDeath>
					</xsl:if>
					<xsl:if test="MSurvivorStatus">
						<MSubStatusCode>
							<xsl:value-of select="MSurvivorStatus/text()" />
						</MSubStatusCode>
					</xsl:if>
				</Member>
			</xsl:for-each>
			<xsl:for-each select="Address">
				<Address>
					<xsl:variable name="var:v34" select="userCSharp:NumA(string(AContractNumber/text()))" />
					<APolicyKey>
						<xsl:value-of select="$var:v34" />
					</APolicyKey>
					<xsl:variable name="var:v35" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<AClassKey>
						<xsl:value-of select="$var:v35" />
					</AClassKey>
					<xsl:variable name="var:v36" select="userCSharp:CertStripZero_A(string(ACertificateNumber/text()))" />
					<xsl:variable name="var:v37" select="userCSharp:ID_A(string($var:v36))" />
					<ACertKey>
						<xsl:value-of select="$var:v37" />
					</ACertKey>
					<AClientNumber>
						<xsl:value-of select="$var:v35" />
					</AClientNumber>
					<AExtraMemberID>
						<xsl:value-of select="$var:v34" />
					</AExtraMemberID>
					<AMemberID>
						<xsl:value-of select="$var:v37" />
					</AMemberID>
					<xsl:if test="ARecordType">
						<ARecordType>
							<xsl:value-of select="ARecordType/text()" />
						</ARecordType>
					</xsl:if>
					<xsl:variable name="var:v39" select="userCSharp:FctStringConcat1(&quot;IMP&quot;)" />
					<AAction>
						<xsl:value-of select="$var:v39" />
					</AAction>
					<xsl:if test="AEffectiveDate">
						<AEffectiveDate>
							<xsl:value-of select="AEffectiveDate/text()" />
						</AEffectiveDate>
					</xsl:if>
					<xsl:variable name="var:v40" select="userCSharp:AddressType(string(AAddressType/text()))" />
					<AAddressType>
						<xsl:value-of select="$var:v40" />
					</AAddressType>
					<xsl:if test="AStreet">
						<AStreet>
							<xsl:value-of select="AStreet/text()" />
						</AStreet>
					</xsl:if>
					<xsl:variable name="var:v41" select="userCSharp:Suite(string(ASuite/text()))" />
					<ASuite>
						<xsl:value-of select="$var:v41" />
					</ASuite>
					<xsl:if test="ACity">
						<ACity>
							<xsl:value-of select="ACity/text()" />
						</ACity>
					</xsl:if>
					<xsl:variable name="var:v42" select="userCSharp:AProv(string(AProvince/text()),string(MResidenceProvinceCode/text()))" />
					<AProvince>
						<xsl:value-of select="$var:v42" />
					</AProvince>
					<AFiller>
						<xsl:value-of select="$var:v35" />
					</AFiller>
					<xsl:if test="ACountryCode">
						<ACountryCode>
							<xsl:value-of select="ACountryCode/text()" />
						</ACountryCode>
					</xsl:if>
					<xsl:if test="APostalCode">
						<APostalCode>
							<xsl:value-of select="APostalCode/text()" />
						</APostalCode>
					</xsl:if>
					<xsl:if test="APhoneNumber">
						<APhoneNumber>
							<xsl:value-of select="APhoneNumber/text()" />
						</APhoneNumber>
					</xsl:if>
					<xsl:if test="AEmailAddress">
						<AEmailAddress>
							<xsl:value-of select="AEmailAddress/text()" />
						</AEmailAddress>
					</xsl:if>
				</Address>
			</xsl:for-each>
			<xsl:for-each select="Benefit">
				<Benefit>
					<xsl:variable name="var:v43" select="userCSharp:NumBN(string(BNContractNumber/text()))" />
					<BNPolicyKey>
						<xsl:value-of select="$var:v43" />
					</BNPolicyKey>
					<xsl:variable name="var:v44" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<BNClassKey>
						<xsl:value-of select="$var:v44" />
					</BNClassKey>
					<xsl:variable name="var:v45" select="userCSharp:CertStripZero_BN(string(BNCertificateNumber/text()))" />
					<xsl:variable name="var:v46" select="userCSharp:ID_BN(string($var:v45))" />
					<BNCertKey>
						<xsl:value-of select="$var:v46" />
					</BNCertKey>
					<BNClientNumber>
						<xsl:value-of select="$var:v44" />
					</BNClientNumber>
					<BNExtraMemberID>
						<xsl:value-of select="$var:v43" />
					</BNExtraMemberID>
					<BNMemberID>
						<xsl:value-of select="$var:v46" />
					</BNMemberID>
					<xsl:if test="BNRecordType">
						<BNRecordType>
							<xsl:value-of select="BNRecordType/text()" />
						</BNRecordType>
					</xsl:if>
					<xsl:variable name="var:v48" select="userCSharp:Action_BN(string(BNAction/text()))" />
					<BNAction>
						<xsl:value-of select="$var:v48" />
					</BNAction>
					<xsl:if test="BNEffectiveDate">
						<BNEffectiveDate>
							<xsl:value-of select="BNEffectiveDate/text()" />
						</BNEffectiveDate>
					</xsl:if>
					<xsl:if test="BNBenefitIdentifier">
						<BNBenefitCode>
							<xsl:value-of select="BNBenefitIdentifier/text()" />
						</BNBenefitCode>
					</xsl:if>
					<xsl:if test="BNBenefitCode">
						<BNOptionFlexCode>
							<xsl:value-of select="BNBenefitCode/text()" />
						</BNOptionFlexCode>
					</xsl:if>
					<xsl:variable name="var:v49" select="userCSharp:DepTypeCode_BN(string(BNDependentTypeCode/text()))" />
					<BNDependentTypeCode>
						<xsl:value-of select="$var:v49" />
					</BNDependentTypeCode>
					<xsl:variable name="var:v50" select="userCSharp:Volume(string($var:v48),string(BNApprovedVolume/text()))" />
					<BNRequestedVolume>
						<xsl:value-of select="$var:v50" />
					</BNRequestedVolume>
					<xsl:variable name="var:v51" select="userCSharp:Units(string($var:v48),string(BNApprovedUnits/text()))" />
					<BNRequestedUnits>
						<xsl:value-of select="$var:v51" />
					</BNRequestedUnits>
					<xsl:variable name="var:v52" select="userCSharp:LateEntFlag_BN(string(BNLateEntrantFlag/text()))" />
					<BNLateEntrantFlag>
						<xsl:value-of select="$var:v52" />
					</BNLateEntrantFlag>
					<BNExcessApprovalFlag>
						<xsl:value-of select="$var:v44" />
					</BNExcessApprovalFlag>
					<BNApprovalAmount>
						<xsl:value-of select="$var:v44" />
					</BNApprovalAmount>
					<BNApprovalEffectiveDate>
						<xsl:value-of select="$var:v44" />
					</BNApprovalEffectiveDate>
					<BNApprovalNumber>
						<xsl:value-of select="$var:v44" />
					</BNApprovalNumber>
					<BNWaiverCode>
						<xsl:value-of select="$var:v44" />
					</BNWaiverCode>
					<BNWaiverEffectiveDate>
						<xsl:value-of select="$var:v44" />
					</BNWaiverEffectiveDate>
					<BNBenefitEffectiveDate>
						<xsl:value-of select="$var:v44" />
					</BNBenefitEffectiveDate>
					<BNBenefitTerminationDate>
						<xsl:value-of select="$var:v44" />
					</BNBenefitTerminationDate>
					<xsl:variable name="var:v53" select="userCSharp:TermReason_BN(string(BNTerminationReasonCode/text()))" />
					<BNTerminationReasonCode>
						<xsl:value-of select="$var:v53" />
					</BNTerminationReasonCode>
					<BNWaiverReasonCode>
						<xsl:value-of select="$var:v44" />
					</BNWaiverReasonCode>
					<BNWaiverOfPremiumInsurer>
						<xsl:value-of select="$var:v44" />
					</BNWaiverOfPremiumInsurer>
				</Benefit>
			</xsl:for-each>
			<xsl:for-each select="BankAccount">
				<BankAccount>
					<xsl:variable name="var:v54" select="userCSharp:NumBK(string(BKContractNumber/text()))" />
					<BKPolicyKey>
						<xsl:value-of select="$var:v54" />
					</BKPolicyKey>
					<xsl:variable name="var:v55" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<BKClassKey>
						<xsl:value-of select="$var:v55" />
					</BKClassKey>
					<xsl:variable name="var:v56" select="userCSharp:CertStripZero_BK(string(BKCertificateNumber/text()))" />
					<xsl:variable name="var:v57" select="userCSharp:ID_BK(string($var:v56))" />
					<BKCertKey>
						<xsl:value-of select="$var:v57" />
					</BKCertKey>
					<BKClientNumber>
						<xsl:value-of select="$var:v55" />
					</BKClientNumber>
					<BKExtraMemberID>
						<xsl:value-of select="$var:v54" />
					</BKExtraMemberID>
					<BKMemberID>
						<xsl:value-of select="$var:v57" />
					</BKMemberID>
					<xsl:if test="BKRecordType">
						<BKRecordType>
							<xsl:value-of select="BKRecordType/text()" />
						</BKRecordType>
					</xsl:if>
					<xsl:variable name="var:v59" select="userCSharp:BKAction(string(BKAction/text()))" />
					<BKAction>
						<xsl:value-of select="$var:v59" />
					</BKAction>
					<xsl:if test="BKEffectiveDate">
						<BKEffectiveDate>
							<xsl:value-of select="BKEffectiveDate/text()" />
						</BKEffectiveDate>
					</xsl:if>
					<xsl:variable name="var:v60" select="userCSharp:BKTransitNum(string(BKAction/text()),string(BKBankTransitNumber/text()))" />
					<BKBankTransitNumber>
						<xsl:value-of select="$var:v60" />
					</BKBankTransitNumber>
					<xsl:if test="BKBranchTransitNumber">
						<BKBranchTransitNumber>
							<xsl:value-of select="BKBranchTransitNumber/text()" />
						</BKBranchTransitNumber>
					</xsl:if>
					<xsl:if test="BKAccountNumber">
						<BKAccountNumber>
							<xsl:value-of select="BKAccountNumber/text()" />
						</BKAccountNumber>
					</xsl:if>
					<xsl:variable name="var:v61" select="userCSharp:FctStringConcat1(&quot;04&quot;)" />
					<BKAccountUsageCode>
						<xsl:value-of select="$var:v61" />
					</BKAccountUsageCode>
				</BankAccount>
			</xsl:for-each>
			<xsl:for-each select="RelatedPerson">
				<RelatedPerson>
					<xsl:variable name="var:v62" select="userCSharp:NumPD(string(PDContractNumber/text()))" />
					<PDPolicyKey>
						<xsl:value-of select="$var:v62" />
					</PDPolicyKey>
					<xsl:variable name="var:v63" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<PDClassKey>
						<xsl:value-of select="$var:v63" />
					</PDClassKey>
					<xsl:variable name="var:v64" select="userCSharp:CertStripZero_PD(string(PDCertificateNumber/text()))" />
					<xsl:variable name="var:v65" select="userCSharp:ID_PD(string($var:v64))" />
					<PDCertKey>
						<xsl:value-of select="$var:v65" />
					</PDCertKey>
					<PDClientNumber>
						<xsl:value-of select="$var:v63" />
					</PDClientNumber>
					<PDExtraMemberID>
						<xsl:value-of select="$var:v62" />
					</PDExtraMemberID>
					<PDMemberID>
						<xsl:value-of select="$var:v65" />
					</PDMemberID>
					<xsl:if test="PDRecordType">
						<PDRecordType>
							<xsl:value-of select="PDRecordType/text()" />
						</PDRecordType>
					</xsl:if>
					<xsl:if test="PDAction">
						<PDAction>
							<xsl:value-of select="PDAction/text()" />
						</PDAction>
					</xsl:if>
					<xsl:variable name="var:v67" select="userCSharp:EffDate_PD(string(PDEffectiveDate/text()))" />
					<PDEffectiveDate>
						<xsl:value-of select="$var:v67" />
					</PDEffectiveDate>
					<xsl:if test="PDFirstName">
						<PDFirstName>
							<xsl:value-of select="PDFirstName/text()" />
						</PDFirstName>
					</xsl:if>
					<PDMiddleInitial>
						<xsl:value-of select="$var:v63" />
					</PDMiddleInitial>
					<xsl:if test="PDLastName">
						<PDLastName>
							<xsl:value-of select="PDLastName/text()" />
						</PDLastName>
					</xsl:if>
					<xsl:if test="PDDateOfBirth">
						<PDDateOfBirth>
							<xsl:value-of select="PDDateOfBirth/text()" />
						</PDDateOfBirth>
					</xsl:if>
					<xsl:variable name="var:v68" select="userCSharp:Gender_PD(string(PDAction/text()),string(PDGender/text()))" />
					<PDGender>
						<xsl:value-of select="$var:v68" />
					</PDGender>
					<xsl:variable name="var:v69" select="userCSharp:Lang_PD(string(PDAction/text()),string(PDLanguagePreference/text()))" />
					<PDLanguagePreference>
						<xsl:value-of select="$var:v69" />
					</PDLanguagePreference>
					<xsl:variable name="var:v70" select="userCSharp:Smoker_PD(string(PDAction/text()),string(PDSmokerStatus/text()))" />
					<PDSmokerStatus>
						<xsl:value-of select="$var:v70" />
					</PDSmokerStatus>
					<PDCertificateNumber>
						<xsl:value-of select="$var:v63" />
					</PDCertificateNumber>
					<xsl:variable name="var:v71" select="userCSharp:SIN_PD(string(PDAction/text()),string(PDSocialInsuranceNumber/text()))" />
					<PDSocialInsuranceNumber>
						<xsl:value-of select="$var:v71" />
					</PDSocialInsuranceNumber>
					<PDEntryNumber>
						<xsl:value-of select="$var:v63" />
					</PDEntryNumber>
					<xsl:if test="PDRelationCode">
						<PDRelationCode>
							<xsl:value-of select="PDRelationCode/text()" />
						</PDRelationCode>
					</xsl:if>
					<PDAcquireDate>
						<xsl:value-of select="$var:v63" />
					</PDAcquireDate>
					<xsl:variable name="var:v72" select="userCSharp:InSchool(string(PDOverAgeStudent/text()))" />
					<PDInSchoolFlag>
						<xsl:value-of select="$var:v72" />
					</PDInSchoolFlag>
					<PDSchoolCode>
						<xsl:value-of select="$var:v63" />
					</PDSchoolCode>
					<xsl:variable name="var:v73" select="userCSharp:NoticeCode(string(PDSpecialDependent/text()))" />
					<PDNoticeCode>
						<xsl:value-of select="$var:v73" />
					</PDNoticeCode>
					<PDTerminationDate>
						<xsl:value-of select="$var:v63" />
					</PDTerminationDate>
					<PDTerminationReason>
						<xsl:value-of select="$var:v63" />
					</PDTerminationReason>
					<xsl:variable name="var:v74" select="userCSharp:PDProv(string(PDAction/text()),string(PDProvinceOfResidence/text()))" />
					<PDProvinceOfResidence>
						<xsl:value-of select="$var:v74" />
					</PDProvinceOfResidence>
					<xsl:variable name="var:v75" select="userCSharp:FctStringConcat1(&quot;N&quot;)" />
					<PDTaxExemptionFlag>
						<xsl:value-of select="$var:v75" />
					</PDTaxExemptionFlag>
					<PDSalutation>
						<xsl:value-of select="$var:v63" />
					</PDSalutation>
					<xsl:if test="PDDateOfRelationship">
						<PDDateOfRelationship>
							<xsl:value-of select="PDDateOfRelationship/text()" />
						</PDDateOfRelationship>
					</xsl:if>
					<xsl:variable name="var:v76" select="userCSharp:PDMultiBirth(string(PDAction/text()))" />
					<PDMultipleBirthIndicator>
						<xsl:value-of select="$var:v76" />
					</PDMultipleBirthIndicator>
				</RelatedPerson>
			</xsl:for-each>
			<xsl:for-each select="Salary">
				<Salary>
					<xsl:variable name="var:v77" select="userCSharp:NumS(string(SContractNumber/text()))" />
					<SPolicyKey>
						<xsl:value-of select="$var:v77" />
					</SPolicyKey>
					<xsl:variable name="var:v78" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<SClassKey>
						<xsl:value-of select="$var:v78" />
					</SClassKey>
					<xsl:variable name="var:v79" select="userCSharp:CertStripZero_S(string(SCertificateNumber/text()))" />
					<xsl:variable name="var:v80" select="userCSharp:ID_S(string($var:v79))" />
					<SCertKey>
						<xsl:value-of select="$var:v80" />
					</SCertKey>
					<SClientNumber>
						<xsl:value-of select="$var:v78" />
					</SClientNumber>
					<SExtraMemberID>
						<xsl:value-of select="$var:v77" />
					</SExtraMemberID>
					<SMemberID>
						<xsl:value-of select="$var:v80" />
					</SMemberID>
					<xsl:if test="SRecordType">
						<SRecordType>
							<xsl:value-of select="SRecordType/text()" />
						</SRecordType>
					</xsl:if>
					<xsl:variable name="var:v82" select="userCSharp:FctStringConcat1(&quot;IMP&quot;)" />
					<SAction>
						<xsl:value-of select="$var:v82" />
					</SAction>
					<xsl:if test="SEffectiveDate">
						<SEffectiveDate>
							<xsl:value-of select="SEffectiveDate/text()" />
						</SEffectiveDate>
					</xsl:if>
					<xsl:variable name="var:v83" select="userCSharp:SalDesc(string(SSalaryDescriptionCode/text()))" />
					<SSalaryDescriptionCode>
						<xsl:value-of select="$var:v83" />
					</SSalaryDescriptionCode>
					<xsl:variable name="var:v84" select="userCSharp:SBasis(string(SAction/text()),string(SSalaryBasis/text()))" />
					<SSalaryBasis>
						<xsl:value-of select="$var:v84" />
					</SSalaryBasis>
					<xsl:if test="SSalaryAmount">
						<SSalaryAmount>
							<xsl:value-of select="SSalaryAmount/text()" />
						</SSalaryAmount>
					</xsl:if>
					<xsl:if test="SHoursPerWeek">
						<SHoursPerWeek>
							<xsl:value-of select="SHoursPerWeek/text()" />
						</SHoursPerWeek>
					</xsl:if>
				</Salary>
			</xsl:for-each>
			<xsl:for-each select="DependentCoverage">
				<DependentCoverage>
					<xsl:variable name="var:v85" select="userCSharp:NumDC(string(DCContractNumber/text()))" />
					<DCPolicyKey>
						<xsl:value-of select="$var:v85" />
					</DCPolicyKey>
					<xsl:variable name="var:v86" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<DCClassKey>
						<xsl:value-of select="$var:v86" />
					</DCClassKey>
					<xsl:variable name="var:v87" select="userCSharp:CertStripZero_DC(string(DCCertificateNumber/text()))" />
					<xsl:variable name="var:v88" select="userCSharp:ID_DC(string($var:v87))" />
					<DCCertKey>
						<xsl:value-of select="$var:v88" />
					</DCCertKey>
					<DCClientNumber>
						<xsl:value-of select="$var:v86" />
					</DCClientNumber>
					<DCExtraMemberID>
						<xsl:value-of select="$var:v85" />
					</DCExtraMemberID>
					<DCMemberID>
						<xsl:value-of select="$var:v88" />
					</DCMemberID>
					<xsl:if test="DCRecordType">
						<DCRecordType>
							<xsl:value-of select="DCRecordType/text()" />
						</DCRecordType>
					</xsl:if>
					<xsl:if test="DCAction">
						<DCAction>
							<xsl:value-of select="DCAction/text()" />
						</DCAction>
					</xsl:if>
					<xsl:variable name="var:v90" select="userCSharp:EffDate_DC(string(DCEffectiveDate/text()))" />
					<DCEffectiveDate>
						<xsl:value-of select="$var:v90" />
					</DCEffectiveDate>
					<xsl:if test="DCFirstName">
						<DCFirstName>
							<xsl:value-of select="DCFirstName/text()" />
						</DCFirstName>
					</xsl:if>
					<xsl:if test="DCLastName">
						<DCLastName>
							<xsl:value-of select="DCLastName/text()" />
						</DCLastName>
					</xsl:if>
					<xsl:if test="DCDateOfBirth">
						<DCDateOfBirth>
							<xsl:value-of select="DCDateOfBirth/text()" />
						</DCDateOfBirth>
					</xsl:if>
					<DCEntryNumber>
						<xsl:value-of select="$var:v86" />
					</DCEntryNumber>
					<xsl:if test="DCBenefitIdentifier">
						<DCBenefitCode>
							<xsl:value-of select="DCBenefitIdentifier/text()" />
						</DCBenefitCode>
					</xsl:if>
					<xsl:variable name="var:v91" select="userCSharp:COBInsurerCode(string(DCCOBInsurerCode/text()))" />
					<DCCOBInsurerCode>
						<xsl:value-of select="$var:v91" />
					</DCCOBInsurerCode>
					<xsl:variable name="var:v92" select="userCSharp:DCCOBFlag(string(DCOtherCoverageIndicator/text()))" />
					<DCCOBFlag>
						<xsl:value-of select="$var:v92" />
					</DCCOBFlag>
					<DCCOBType>
						<xsl:value-of select="$var:v86" />
					</DCCOBType>
					<xsl:variable name="var:v93" select="userCSharp:CovDepCode(string(DCAction/text()),string(DCCoveredDependentCode/text()))" />
					<DCCoveredDependentCode>
						<xsl:value-of select="$var:v93" />
					</DCCoveredDependentCode>
					<xsl:variable name="var:v94" select="userCSharp:NumDCCOB(string(DCCOBPolicyNumber/text()))" />
					<DCCOBPolicyNumber>
						<xsl:value-of select="$var:v94" />
					</DCCOBPolicyNumber>
					<xsl:variable name="var:v95" select="userCSharp:CertStripZero_DCCOB(string(DCCOBCertificateNumber/text()))" />
					<DCCOBCertificateNumber>
						<xsl:value-of select="$var:v95" />
					</DCCOBCertificateNumber>
					<xsl:if test="DCSpousalDateOfBirth">
						<DCSpousalDateOfBirth>
							<xsl:value-of select="DCSpousalDateOfBirth/text()" />
						</DCSpousalDateOfBirth>
					</xsl:if>
					<xsl:variable name="var:v96" select="userCSharp:DCDepPriRes(string(DCCOBDependentPrimaryResidence/text()))" />
					<DCCOBDependentPrimaryResidence>
						<xsl:value-of select="$var:v96" />
					</DCCOBDependentPrimaryResidence>
				</DependentCoverage>
			</xsl:for-each>
			<xsl:for-each select="BeneficiaryCoverage">
				<BeneficiaryCoverage>
					<xsl:variable name="var:v97" select="userCSharp:NumBC(string(BCContractNumber/text()))" />
					<BCPolicyKey>
						<xsl:value-of select="$var:v97" />
					</BCPolicyKey>
					<xsl:variable name="var:v98" select="userCSharp:FctStringConcat1(&quot; &quot;)" />
					<BCClassKey>
						<xsl:value-of select="$var:v98" />
					</BCClassKey>
					<xsl:variable name="var:v99" select="userCSharp:CertStripZero_BC(string(BCCertificateNumber/text()))" />
					<xsl:variable name="var:v100" select="userCSharp:ID_BC(string($var:v99))" />
					<BCCertKey>
						<xsl:value-of select="$var:v100" />
					</BCCertKey>
					<BCClientNumber>
						<xsl:value-of select="$var:v98" />
					</BCClientNumber>
					<BCExtraMemberID>
						<xsl:value-of select="$var:v97" />
					</BCExtraMemberID>
					<BCMemberID>
						<xsl:value-of select="$var:v100" />
					</BCMemberID>
					<xsl:if test="BCRecordType">
						<BCRecordType>
							<xsl:value-of select="BCRecordType/text()" />
						</BCRecordType>
					</xsl:if>
					<xsl:variable name="var:v102" select="userCSharp:BCAction(string(BCAction/text()))" />
					<BCAction>
						<xsl:value-of select="$var:v102" />
					</BCAction>
					<xsl:if test="BCEffectiveDate">
						<BCEffectiveDate>
							<xsl:value-of select="BCEffectiveDate/text()" />
						</BCEffectiveDate>
					</xsl:if>
					<xsl:if test="BCFirstName">
						<BCFirstName>
							<xsl:value-of select="BCFirstName/text()" />
						</BCFirstName>
					</xsl:if>
					<xsl:if test="BCLastName">
						<BCLastName>
							<xsl:value-of select="BCLastName/text()" />
						</BCLastName>
					</xsl:if>
					<xsl:if test="BCDateOfBirth">
						<BCDateOfBirth>
							<xsl:value-of select="BCDateOfBirth/text()" />
						</BCDateOfBirth>
					</xsl:if>
					<BCEntryNumber>
						<xsl:value-of select="$var:v98" />
					</BCEntryNumber>
					<xsl:if test="BCBenefitIdentifier">
						<BCBenefitCode>
							<xsl:value-of select="BCBenefitIdentifier/text()" />
						</BCBenefitCode>
					</xsl:if>
					<xsl:variable name="var:v103" select="userCSharp:ShareOfBen(string(BCShareOfBenefit/text()))" />
					<BCShareOfBenefit>
						<xsl:value-of select="$var:v103" />
					</BCShareOfBenefit>
				</BeneficiaryCoverage>
			</xsl:for-each>
			<xsl:for-each select="Trailer">
				<Trailer>
					<xsl:variable name="var:v104" select="userCSharp:SetTRLClientName()" />
					<TRLClientName>
						<xsl:value-of select="$var:v104" />
					</TRLClientName>
					<xsl:if test="TRLRecordType">
						<TRLRecordType>
							<xsl:value-of select="TRLRecordType/text()" />
						</TRLRecordType>
					</xsl:if>
					<xsl:variable name="var:v105" select="userCSharp:SetTRLFileCreationDate()" />
					<TRLFileCreationDate>
						<xsl:value-of select="$var:v105" />
					</TRLFileCreationDate>
					<xsl:if test="TRLRecordCount">
						<TRLRecordCount>
							<xsl:value-of select="TRLRecordCount/text()" />
						</TRLRecordCount>
					</xsl:if>
				</Trailer>
			</xsl:for-each>
			<xsl:for-each select="Error">
				<Error>
					<xsl:if test="ErrorField">
						<ErrorField>
							<xsl:value-of select="ErrorField/text()" />
						</ErrorField>
					</xsl:if>
				</Error>
			</xsl:for-each>
		</Generic>
	</xsl:template>
	<msxsl:script language="CSharp" implements-prefix="userCSharp">
				<![CDATA[
		// this saves HDRMemberIDType from the Header record
		// so it can be referenced while processing other records

		private string saveMemberIDType;

		public string SaveMIT  (string inMIT )
		{
			string resultString;
			if ((inMIT == "1") | (inMIT == "2") | (inMIT == "3"))
				resultString = inMIT;
			else
				resultString = "3";
			saveMemberIDType = resultString;

			return resultString;
		}


		public string SetFileFormat(string FileFormat, string HDRFileFormat )
		{
			string resultString;
			if (FileFormat != " ")
				resultString = FileFormat;
			else
				resultString = HDRFileFormat;
			
			return resultString;
		}

		public string SetProcessType(string FileProcessType, string HDRFileProcessType )
		{
			string resultString;
			if (HDRFileProcessType != " ")
				resultString = HDRFileProcessType;
			else
				resultString = FileProcessType;
			
			return resultString;
		}


		public string SetHDRLanguage(string HDRLanguage )
		{
			if (HDRLanguage == "2")
				return "F";
			else
				return "E";
		}


		public string SetFCD  (string inFCD )
		{
			return inFCD;
		}


		public string SetCN  (string inCN )
		{
			return inCN;
		}


		public string SetTRLClientName(  )
		{
			return " ";
		}

		public string SetTRLFileCreationDate(  )
		{
			return " ";
		}

		public string NumM (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');

		}

		public string FctStringConcat1(string p_strParm0 )
		{
			return p_strParm0;
		}

		public string FName(string inFName )
		{
			return inFName;
		}

		public string LName(string inLName )
		{
			return inLName;
		}

		public string DOB(string inDOB )
		{
			return inDOB;
		}


		public string Gender(string inGender )
		{
			string returnString;

			switch (inGender)
			{
				case "1":
					returnString = "M";
					break;
				case "2":
					returnString = "F";
					break;
				default:
					returnString = " ";
					break;
			}

			return returnString;
		}


		public string Lang (string inLang )
		{
			string returnString;

			switch(inLang)
			{
				case "1":
					returnString = "E";
					break;
				case "2":
					returnString = "F";
					break;
				default:
					returnString = " ";
					break;
			}

			return returnString;
		}


		public string Smoker (string inSmoker )
		{
			string returnString;

			switch(inSmoker)
			{
				case "1":
					returnString = "Y";
					break;
				case "2":
					returnString = "N";
					break;
				case "3":
					returnString = "N";
					break;
				default:
					returnString = " ";
					break;
			}

			return returnString;
		}

		public string CertStripZero_M (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');

		}


		public string SIN(string inSIN )
		{
			string returnString;

			if (inSIN.Length < 1)
				returnString = " ";
			else
			{
				returnString = "";

				for (int i = 0; i < inSIN.Length; i++)
				{
					if (i == 3)
						returnString += "-";
								   
					if (i == 6)
						returnString += "-";
					 
					//				returnString += mid(inSIN, i, 1);
					returnString += inSIN.Substring(i, 1);
				}
			}

			return returnString;
		}

		public string EmpID(string inEmpID )
		{
			return inEmpID.Trim();
		}


		public string PNum(string inPNum )
		{
			string returnString;

			returnString = inPNum;
				   
			if (returnString == "")
				returnString = " ";

			return returnString;
		}



		public string LNum(string inLNum )
		{
			string returnString = "";

			returnString = inLNum.Trim();
			if (returnString.Length < 1)
				returnString = " ";
			else
			{
				if (Char.IsNumber(returnString, 0))
					returnString = returnString.PadLeft(3, '0');
			}


			return returnString;
		}

		public string CNum(string inCode )
		{
			string inCodeTrim = inCode.Trim();
			try
			{
				int numTest = Convert.ToInt16(inCodeTrim);
				inCodeTrim = inCodeTrim.PadLeft(3, '0');
			}
			catch
			{
			}
			return inCodeTrim == "000" ? "   " : inCodeTrim;
		}

		public string G1(string inG1 )
		{
			return inG1;
		}

		public string G2(string inG2 )
		{
			return inG2;
		}

		public string G3(string inG3 )
		{
			return inG3;
		}

		public string DofE(string inDofE )
		{
			return inDofE;
		}


		// this saves saveRP to be used in the WP functoid
		private string saveRP;

		public string RP(string Action, string inRP )
		{
			string returnString;

			switch(inRP)
			{
				case "NF":
					returnString = "NL";
					break;
				case "PQ":
					returnString = "QC";
					break;
				default:
					returnString = inRP;
					break;
			}
     
			switch (returnString)
			{
				case "AB":
				case "BC":
				case "MB":
				case "NB":
				case "NL":
				case "NS":
				case "NT":
				case "NU":
				case "ON":
				case "OT":
				case "PE":
				case "QC":
				case "SK":
				case "US":
				case "YT":
					returnString = returnString;
					break;
				default:
					if  (Action == "ADD")
						returnString = "OT";
					else
						returnString = " ";
					break;
			}

			saveRP = returnString;

			return returnString;
		}


		public string RfT(string Action, string inRfT )
		{
			string returnString;

			returnString = inRfT.Trim();

			if (Action == "TRM")
			{
				switch (returnString)
				{
					case "0":
					case "1":
					case "2":
					case "3":
					case "4":
					case "5":
					case "6":
					case "7":
					case "8":
					case "9":
					case "10":
						returnString = returnString;
						break;
					default:
						returnString = "0";
						break;
				}
			}
			else
				returnString = "0";

			return returnString;
		}

		public string Occ(string inOcc )
		{
			string returnString = inOcc;


			if ((returnString.Trim() == "") | (inOcc.Trim() == ""))
				returnString = " ";
			else
			{	
				returnString = inOcc.Trim();
				switch (returnString)
				{
				case "0":
				case "1":
				case "2":
				case "3":
				case "4":
				case "5":
				case "6":
				case "7":
				case "8":
				case "9":
					returnString = returnString;
					break;
				default:
					returnString = " ";
					break;
				}
			}

			return returnString;
		}

		public string ID_M(string Cert)
		{
			string returnString;
			
			returnString = Cert;

			return returnString;
		}

		public string WP(string Action, string inWP )
		{
			string returnString;

			switch(inWP)
			{
				case "NF":
					returnString = "NL";
					break;
				case "PQ":
					returnString = "QC";
					break;
				default:
					returnString = inWP;
					break;
			}
     
			switch (returnString)
			{
				case "AB":
				case "BC":
				case "MB":
				case "NB":
				case "NL":
				case "NS":
				case "NT":
				case "NU":
				case "ON":
				case "OT":
				case "PE":
				case "QC":
				case "SK":
				case "US":
				case "YT":
					returnString = returnString;
					break;
				default:
					returnString = saveRP;
					break;
			}

			if (returnString == "")
				returnString = " ";

			return returnString;
		}

		public string TaxExempt (string Action, string inTaxExempt )
		{
			string returnString;

			switch(inTaxExempt)
			{
				case "1":
					returnString  = "Y";
					break;
				case "2":
					returnString = "N";
					break;
				default:
					returnString = " ";
					break;
			}

			if ((Action == "ADD") && (returnString == " "))
				returnString = "N";

			return returnString;
		}

		public string NumA (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');

		}

		public string ID_A(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}


		public string Suite (string inSuite )
		{
			if (inSuite == "                              ")
				return "******************************";
			else
				return inSuite;
		}

		public string CertStripZero_A (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)						
								returnString += TestChar;
								
						}

						if (returnString == "")
							returnString = " ";

						return returnString;
						*/
		}

		public string AddressType(string p_strParm0 )
		{
			string returnString = "1";
			if (p_strParm0 == "2")
				returnString = "3";
								
			if (p_strParm0 == "3")
				returnString = "2";

			return returnString;
		}

		public string AProv(string inAProv, string inMWProv)
		{
			string returnString;

			switch (inAProv)
			{
				case "NF":
					returnString = "NL";
					break;
				case "PQ":
					returnString = "QC";
					break;
				default:
					returnString = inAProv;
					break;
			}

			switch (returnString)
			{
				case "AB":
				case "BC":
				case "MB":
				case "NB":
				case "NL":
				case "NS":
				case "NT":
				case "NU":
				case "ON":
				case "OT":
				case "PE":
				case "QC":
				case "SK":
				case "US":
				case "YT":
					returnString = returnString;
					break;
				default:
					returnString = "OT";
					break;
			}
			if (returnString == "OT")
			{
			returnString = inMWProv;
			}
			return returnString;
		}


		public string NumS (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');
			/*			string returnString;
			
						returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string ID_S(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}

		public string SalDesc(string inSalDesc )
		{
			switch (inSalDesc)
			{
				case "01":
				case "02":
				case "03":
				case "04":
				case "05":
				case "06":
					return inSalDesc;
				default:
					return "01";
			}
		}

		public string SBasis(string Action, string inSBasis )
		{
			string returnString;
			returnString = inSBasis;
			if (Action == "ADD")
				if ((inSBasis == "") | (inSBasis == " "))
					returnString = "1";
		
			return returnString;																	  
		}


		public string CertStripZero_S (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString;
						returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
						}
		
						if (returnString == "")
							returnString = " ";

						return returnString;
						*/
		}

		public string NumBK (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');

			/*			string returnString;
						returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_BK (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
			
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";
		
						return returnString;
						*/
		}

		public string ID_BK(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}


		public string BKAction(string p_strParm0 )
		{
			if (p_strParm0 == "TRM")
				return p_strParm0;
			else
				return "IMP";
		}

		public string BKTransitNum (string Action, string inBKTransitNum )
		{
			string returnString;
			returnString = inBKTransitNum.Trim();
			if ((returnString == "") | (returnString == " "))
				if (Action == "ADD")
					returnString = "000";
				else
					returnString = "   ";
			else
			{
				returnString = returnString.PadLeft(3, '0');
				/*				int pad = 3 - returnString.Length;
								for (int i = 1; i <= pad; i++)
								{
									returnString = "0" + returnString;
								} */
			}

			return returnString;												
		}


		public string NumPD (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');
			/*
						string returnString;
						returnString = p_strParm0.Trim();

						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_PD (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";
							
						return returnString;
						*/
		}




		public string ID_PD(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}


		public string Gender_PD(string Action, string inGender )
		{
			string returnString;

			if (Action == "TRM")
				returnString = " ";
			else
				switch (inGender)
				{
					case "1":
						returnString  = "M";
						break;
					case "2":
						returnString = "F";
						break;
					default:
						returnString = " ";
						break;
				}

			return returnString;
		}



		public string Lang_PD (string Action, string inLang )
		{
			string returnString;

			if (Action == "TRM")
				returnString = " ";
			else
				switch (inLang)
				{
					case "1":
						returnString  = "E";
						break;
					case "2":
						returnString = "F";
						break;
					default:
						returnString = " ";
						break;
				}

			return returnString;
		}

		public string Smoker_PD (string Action, string inSmoker )
		{
			string returnString;

			if (Action == "TRM")
				returnString = " ";
			else
				switch (inSmoker)
				{
					case "1":
						returnString  = "Y";
						break;
					case "2":
						returnString = "N";
						break;
					case "3":
						returnString = "N";
						break;
					default:
						returnString = " ";
						break;
				}

			return returnString;
		}


		public string SIN_PD(string Action, string inSIN )
		{
			string returnString;

			if ((Action == "TRM") | (inSIN.Length < 1))
				returnString = " ";
			else
			{
				returnString = "";

				for (int i = 0; i < inSIN.Length; i++)
				{
					if (i == 3)
						returnString = returnString + "-";
								   
					if (i == 6)
						returnString = returnString + "-";
					 
					//				returnString = returnString + mid(inSIN, i, 1);
					returnString = returnString + inSIN.Substring(i, 1);
				}
			}
			return returnString;
		}


		public string InSchool (string p_strParm0 )
		{
			switch ( p_strParm0 )
			{
				case "1":
					return "Y";
				case "2":
					return "N";
				default:
					return " ";
			}
		}


		public string NoticeCode(string inNoticeCode )
		{
			switch (inNoticeCode)
			{
				case "0":
				case "1":
				case "2":
				case "3":
				case "4":
				case "5":
				case "6":
				case "7":
					return inNoticeCode;
				default:
					return " ";
			}
		}

		public string PDProv(string Action, string inPDProv )
		{
			string returnString;

			if (Action == "TRM")
				returnString = " ";
			else
				switch (inPDProv)
				{
					case "NF":
						returnString = "NL";
						break;
					case "PQ":
						returnString = "QC";
						break;
					default:
						returnString = inPDProv;
						break;
				}
     
			switch (returnString)
			{
				case "AB":
				case "BC":
				case "MB":
				case "NB":
				case "NL":
				case "NS":
				case "NT":
				case "NU":
				case "ON":
				case "OT":
				case "PE":
				case "QC":
				case "SK":
				case "US":
				case "YT":
					returnString = returnString;
					break;
				default:
					if  (Action == "ADD")
						returnString = "OT";
					else
						returnString = " ";
					break;
			}

			return returnString;
		}

		public string EffDate_PD(string p_strParm0 )
		{
			// set eff. date to the first of the next month if it's not supplied
			if ((p_strParm0 == "") | (p_strParm0 == " "))
			{
				int yr = DateTime.Today.Year;
				int mth = DateTime.Today.Month;
				mth = mth + 1;
				if (mth > 12)
				{
					mth = 1;
					yr = yr + 1;
				}
		
				string y = yr.ToString();
				string m = mth.ToString();
				string d = "01";

				if (m.Length == 1)
					m = "0" + m;

				return y + m + d;
			}
			else
				return p_strParm0;
		}


		public string PDMultiBirth(string Action )
		{
			if (Action == "TRM")
				return " ";
			else
				return "N";
		}


		public string NumBN (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');
			/*
						string returnString;

						returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_BN (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";
							
						return returnString;							 
						*/
		}


		public string ID_BN (string Cert)
		{
			string returnString;
			
			returnString = Cert;
	
			return returnString;
		}



		public string Action_BN (string p_strParm0 )
		{
			if ((p_strParm0 == "ADD") | (p_strParm0 == "REI") | (p_strParm0 == "TRM") | (p_strParm0 == "UPD"))
				return p_strParm0;
			else
				return "IMP";
		}

		public string DepTypeCode_BN (string inDepTypeCode_BN )
		{
			string returnString = inDepTypeCode_BN;

			switch (returnString)
			{
				case "1":
				case "2":
				case "3":
				case "4":
				case "7":
					returnString = returnString;
					break;
				default:
					returnString = " ";
					break;
			}

			return returnString;
		}

		public string Volume (string Action, string inVolume )
		{
			if (Action == "TRM")
				return " ";
			else
				return inVolume;
		}


		public string Units (string Action, string inUnits )
		{
			if (Action == "TRM")
				return " ";
			else
				return inUnits;
		}

		public string LateEntFlag_BN (string inLateEntFlag_BN )
		{
			if (inLateEntFlag_BN == "1")
				return "Y";
			else
				return " ";
		}

		public string TermReason_BN (string inTermReason_BN )
		{
			string returnString;

			switch (inTermReason_BN)
			{
				case "1":
					returnString = "2";
					break;
				case "2":
					returnString = "3";
					break;
				default:
					returnString = " ";
					break;
			}

			return returnString;
		}



		public string NumDC (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');
			/*
						string returnString;
						returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_DC (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";
							
						return returnString;							 
						*/
		}

		public string ID_DC(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}



		public string EffDate_DC(string p_strParm0 )
		{

			// set eff. date to the first of the next month if it's not supplied

			if ((p_strParm0 == "") | (p_strParm0 == " "))
			{
				int yr = DateTime.Today.Year;
				int mth = DateTime.Today.Month;
				mth = mth + 1;
				if (mth > 12)
				{
					mth = 1;
					yr = yr + 1;
				}
				string y = yr.ToString();
				string m = mth.ToString();
				string d = "01";
				if (m.Length == 1)
				{
					m = "0" + m;
				}
				return y + m + d;
			}
			else
				return p_strParm0;
		}

		public string CovDepCode(string inAction, string inCode )
		{
			string returnString;

			switch (inCode)
			{
				case "0":
					returnString = "0";
					break;
				case "1":
					returnString = "2";
					break;
				case "2":
					returnString = "3";
					break;
				default:
					if (inAction == "ADD")
						returnString = "0";
					else
						returnString = " ";
					break;
			}

			return returnString;
		}

		public string DCCOBFlag(string DCOthCovInd )
		{
			string returnString = " ";
			if ((DCOthCovInd == "1") | (DCOthCovInd == "2"))
				returnString = DCOthCovInd;

			return returnString;
		}

		public string NumDCCOB (string p_strParm0 )
		{
			if (p_strParm0.Trim() == "")
				return " ";
			else
				return p_strParm0.Trim().PadLeft(7, '0');
			/*
						string returnString;	
						returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_DCCOB (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString  = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i ++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";

						return returnString;
						*/
		}


		public string DCDepPriRes(string p_strParm0 )
		{
			string returnString  = "2";
			if ((p_strParm0 == "1") | (p_strParm0 == "3"))
				returnString = p_strParm0;
		
			return returnString;								
		}

		public string COBInsurerCode(string inCOBInsurerCode )
		{
			switch (inCOBInsurerCode)
			{
				case "1":
					return "MAN";
				case "2":
					return "OTH";
				default:
					return inCOBInsurerCode;
			}
		}

		public string NumBC (string p_strParm0 )
		{
			return p_strParm0.Trim().PadLeft(7, '0');
			/*
						string returnString = p_strParm0.Trim();
						int pad = 7 - returnString.Length;
						for (int i = 1; i <= pad; i++)
						{
							returnString = "0" + returnString;
						}

						return returnString; */
		}

		public string CertStripZero_BC (string p_strParm0 )
		{
			return p_strParm0.TrimStart(' ').TrimStart('0').PadRight(1, ' ');
			/*
						string returnString = "";
						int StopBlanking = 0;
						string TestChar;

						for (int i = 1; i <= p_strParm0.Length; i++)
						{
							TestChar = mid(p_strParm0, i, 1);
							if (TestChar != "0")
								StopBlanking = 1;
							   
							if (StopBlanking == 1)
								returnString = returnString + TestChar;
								
						}
						if (returnString == "")
							returnString = " ";

						return returnString;
						*/
		}




		public string ID_BC(string Cert)
		{
			string returnString;

			returnString = Cert;

			return returnString;
		}


		public string ShareOfBen(string p_strParm0 )
		{
			if ((p_strParm0 == "") | (p_strParm0 == " "))
				return "100.00";
			else
				return p_strParm0;
		}

		public string BCAction(string inAction )
		{
			if (inAction == "TRM")
				return "TRM";
			else
				return "IMP";
		}	

]]>
			</msxsl:script>
</xsl:stylesheet>
