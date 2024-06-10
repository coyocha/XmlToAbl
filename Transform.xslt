<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:ws="urn:com.workday/workersync"
	xmlns:helper="urn:my-xsltHelper">
	
	<xsl:output method="text"/>
	
	<xsl:template match="/ws:Worker_Sync">
		
		<!-- HEADER -->
		<xsl:value-of select="helper:SetRight('HDR',3)"/>
		<xsl:value-of select="helper:SetRight('CLIENT NAME',30)"/>
		<xsl:value-of select="helper:FormatDateAndPadRight(ws:Header/ws:Current_Entry_Time,8,'yyyyMMdd')"/>
		<xsl:value-of select="helper:SetRight(ws:Header/ws:Version,5)"/>
		<xsl:value-of select="helper:SetRight('ALLBENEFITS',20)"/>
		<xsl:value-of select="helper:SetRight('3',1)"/>
		<xsl:value-of select="helper:SetRight('',6)"/>
		<xsl:value-of select="helper:SetRight('2',1)"/>
		<xsl:value-of select="helper:SetRight('',15)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetRight('',2)"/>
		<xsl:text>&#10;</xsl:text> <!-- This is a newline character -->
		
		<!-- iterate over the ws:worker elements -->
		<xsl:apply-templates select="ws:Worker"/>
		
		<!-- TRAILER -->
		<xsl:value-of select="helper:SetRight('TRL',3)"/>
		<xsl:value-of select="helper:SetLeft(ws:Header/ws:Worker_Count,10,'0')"/>
		
	</xsl:template>
	
	<xsl:template match="ws:Worker">
		
		<xsl:if test=".//*[@ws:PriorValue]">
			
			<xsl:call-template name="Member">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
			
			<xsl:if test="ws:Personal/ws:Address_Data/*[@ws:PriorValue] 
				or ws:Personal/ws:Phone_Data/*[@ws:PriorValue] 
				or ws:Personal/ws:Email_Data/*[@ws:PriorValue] 
				or ws:Status/*[@ws:PriorValue]">
				<xsl:call-template name="Address">
					<xsl:with-param name="node" select="."/>
				</xsl:call-template>
			</xsl:if>
			
			<xsl:if test="ws:Compensation/*[@ws:PriorValue] 
				or ws:Position/*[@ws:PriorValue]">
				<xsl:call-template name="Salary">
					<xsl:with-param name="node" select="."/>
				</xsl:call-template>
			</xsl:if>
			
		</xsl:if>
		
	</xsl:template>
	
	<xsl:template name="Member">
		<xsl:param name="node"/>
		<xsl:value-of select="helper:SetRight('M',3)"/>
		<xsl:value-of select="helper:SetRight('Client#',7)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<!-- Static for now -->
		<xsl:value-of select="helper:FormatDateAndPadRight('2024-01-01',8,'yyyyMMdd')"/>
		<xsl:value-of select="helper:SetRight($node/ws:Summary/ws:Employee_ID,9)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<!-- Filler -->
		<xsl:value-of select="helper:SetRight('',9)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Name_Data/ws:First_Name,30)"/>
		<!-- Filler -->
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Name_Data/ws:Middle_Name,6)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Name_Data/ws:Last_Name,30)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Birth_Date,8)"/>
		<xsl:value-of select="helper:SetGender($node/ws:Personal/ws:Gender)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetTobacco($node/ws:Personal/ws:Tobacco_Use)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<xsl:value-of select="helper:FormatDateAndPadRight($node/ws:Status/ws:Hire_Date,8,'yyyyMMdd')"/>
		
		<xsl:value-of select="helper:SetRight('',2)"/>
		<xsl:value-of select="helper:SetRight('',2)"/>
		<xsl:value-of select="helper:SetRight('',2)"/>
		
		<xsl:value-of select="helper:SetRight('',8)"/>
		
		<xsl:choose>
			<xsl:when test="$node/ws:Status/ws:Retired='true'">
				<xsl:value-of select="helper:FormatDateAndPadRight($node/ws:Status/ws:Retirment_Date,8,'yyyyMMdd')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="helper:SetRight('',8)"/>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',8)"/>
		<xsl:value-of select="helper:SetRight('',1)"/>
		
		<xsl:text>&#10;</xsl:text> <!-- This is a newline character -->
	</xsl:template>
	
	<xsl:template name="Address">
		<xsl:param name="node"/>
		<xsl:value-of select="helper:SetRight('A',3)"/>
		<xsl:value-of select="helper:SetRight('Client#',7)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<!-- Static for now -->
		<xsl:value-of select="helper:FormatDateAndPadRight('2024-01-01',8,'yyyyMMdd')"/>
		<xsl:value-of select="helper:SetRight($node/ws:Summary/ws:Employee_ID,9)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<xsl:value-of select="helper:SetRight('',9)"/>
		<!-- Static for now -->
		<xsl:value-of select="helper:SetRight('1',1)"/>
		
		<xsl:choose>
			<xsl:when test="$node/ws:Personal/ws:Address_Data[ws:Address_type='HOME']">
				<xsl:for-each select="$node/ws:Personal/ws:Address_Data[ws:Address_type='HOME']">
					
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Address_Line_Data[@ws:Label='Address Line 1'],30)"/>
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Address_Line_Data[@ws:Label='Address Line 2'],30)"/>
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Municipality,30)"/>
					
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$node/ws:Personal/ws:Address_Data[ws:Address_type='WORK']">
					
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Address_Line_Data[@ws:Label='Address Line 1'],30)"/>
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Address_Line_Data[@ws:Label='Address Line 2'],30)"/>
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Municipality,30)"/>
					
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Region,2)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Country,1)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Address_Data/ws:Postal_Code,15)"/>
		
		<xsl:choose>
			<xsl:when test="$node/ws:Personal/ws:Phone_Data[ws:Phone_Type='HOME']">
				<xsl:for-each select="$node/ws:Personal/ws:Phone_Data[ws:Phone_Type='HOME']">
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Phone_Data/ws:Formatted_Phone_Number,30)"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$node/ws:Personal/ws:Phone_Data[ws:Phone_Type='WORK']">
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Phone_Data/ws:Formatted_Phone_Number,30)"/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:choose>
			<xsl:when test="$node/ws:Personal/ws:Email_Data[ws:Email_Type='HOME']">
				<xsl:for-each select="$node/ws:Personal/ws:Email_Data[ws:Email_Type='HOME']">
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Email_Data/ws:Email_Address,128)"/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$node/ws:Email_Data[ws:Email_Type='WORK']">
					<xsl:value-of select="helper:SetRight($node/ws:Personal/ws:Email_Data/ws:Email_Address,128)"/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:text>&#10;</xsl:text> <!-- This is a newline character -->
	</xsl:template>
	
	<xsl:template name="Salary">
		<xsl:param name="node"/>
		<xsl:value-of select="helper:SetRight('S',3)"/>
		<xsl:value-of select="helper:SetRight('Client#',7)"/>
		<xsl:value-of select="helper:SetRight('',3)"/>
		<!-- Static for now -->
		<xsl:value-of select="helper:FormatDateAndPadRight('2024-01-01',8,'yyyyMMdd')"/>
		<xsl:value-of select="helper:SetRight($node/ws:Summary/ws:Employee_ID,9)"/>
		<xsl:value-of select="helper:SetRight('',10)"/>
		<!-- FILLER -->
		<xsl:value-of select="helper:SetRight('',9)"/>
		<xsl:value-of select="helper:SetRight('',2)"/>
		<xsl:value-of select="helper:SetSalaryBasis($node/ws:Compensation/ws:Base_Pay_Frequency)"/>
		<xsl:value-of select="helper:SetRight($node/ws:Compensation/ws:Total_Annual_Base_Pay,11)"/>
		
		<xsl:choose>
			<xsl:when test="$node/ws:Position[ws:Primary_Position='true']">
				<xsl:for-each select="$node/ws:Position[ws:Primary_Position='true']">
					
					<xsl:value-of select="helper:SetRight($node/ws:Position/ws:Scheduled_Weekly_Hours,8)"/>
					
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:text>&#10;</xsl:text> <!-- This is a newline character -->
	</xsl:template>
	
	
</xsl:stylesheet>
