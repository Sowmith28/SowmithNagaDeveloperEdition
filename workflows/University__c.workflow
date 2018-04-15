<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>about_the_university</fullName>
        <description>about the university</description>
        <protected>false</protected>
        <recipients>
            <recipient>sowmith.naga28@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>University_Name</fullName>
        <field>Name</field>
        <name>University Name</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>emailtest</fullName>
        <actions>
            <name>about_the_university</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>University_Name</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>University__c.Name</field>
            <operation>equals</operation>
            <value>lpu</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
