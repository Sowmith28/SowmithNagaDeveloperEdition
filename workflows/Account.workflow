<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Approval_Test_1</fullName>
        <ccEmails>Kothasainaga.sowmith@cognizant.com</ccEmails>
        <description>Approval Test 1</description>
        <protected>false</protected>
        <recipients>
            <recipient>sowmith.naga28@gmail.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Approval_Test1</template>
    </alerts>
    <alerts>
        <fullName>Test_Email_Alert_1</fullName>
        <ccEmails>Kothasainaga.sowmith@cognizant.com</ccEmails>
        <description>Test Email Alert 1</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Type_To_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Account Type To Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Type_To_Pending</fullName>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>Account Type To Pending</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Account_Type_To_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Account Type To Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update_1</fullName>
        <field>CustomerPriority__c</field>
        <literalValue>High</literalValue>
        <name>Field Update 1</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update_2</fullName>
        <field>AccountNumber</field>
        <formula>&quot;85000&quot;</formula>
        <name>Field Update 2</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Texas_Owner</fullName>
        <field>OwnerId</field>
        <lookupValue>sowmith.naga28@gmail.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>Texas Owner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Test 1</fullName>
        <actions>
            <name>Test_Email_Alert_1</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Field_Update_1</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Test_task1</name>
            <type>Task</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>startsWith</operation>
            <value>Y</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Test 2</fullName>
        <actions>
            <name>Field_Update_2</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>startsWith</operation>
            <value>Ya</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Account.CreatedDate</offsetFromField>
            <timeLength>0</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>TestDeloitee</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>contains</operation>
            <value>Test</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <tasks>
        <fullName>Test_task1</fullName>
        <assignedTo>sowmith.naga28@gmail.com</assignedTo>
        <assignedToType>user</assignedToType>
        <description>Test Task 1</description>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Account.CreatedDate</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Test task1</subject>
    </tasks>
</Workflow>
