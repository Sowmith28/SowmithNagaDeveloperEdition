@isTest
public class MetadataCBA_Test {
    
static testmethod void method1(){
    MetaData_CBA.MiniLayout minilayout1 = new MetaData_CBA.MiniLayout();
    MetaData_CBA.RelatedListItem  relatedlistitem  = new  MetaData_CBA.RelatedListItem();
    MetaData_CBA.CustomConsoleComponents ccc = new MetaData_CBA.CustomConsoleComponents();
    MetaData_CBA.FilterItem filter_item = new MetaData_CBA.FilterItem();
    MetaData_CBA.ReportChartComponentLayoutItem rccli = new MetaData_CBA.ReportChartComponentLayoutItem();
    MetaData_CBA.BusinessProcess bp = new  MetaData_CBA.BusinessProcess();
    MetaData_CBA.SharingRecalculation sr = new MetaData_CBA.SharingRecalculation(); 
    MetaData_CBA.RelatedContentItem rci = new MetaData_CBA.RelatedContentItem();
    MetaData_CBA.SummaryLayoutItem sli = new MetaData_CBA.SummaryLayoutItem();
    MetaData_CBA.QuickActionLayoutItem qali = new MetaData_CBA.QuickActionLayoutItem();
    MetaData_CBA.PlatformActionList pal = new MetaData_CBA.PlatformActionList();
    MetaData_CBA.ArticleTypeChannelDisplay atcd = new MetaData_CBA.ArticleTypeChannelDisplay();
    MetaData_CBA.ProfileCustomPermissions pcp = new MetaData_CBA.ProfileCustomPermissions();
    MetaData_CBA.FieldSet fs = new MetaData_CBA.FieldSet();
    MetaData_CBA.ProfileLoginHours plh = new MetaData_CBA.ProfileLoginHours();
    MetaData_CBA.CompactLayout cl = new MetaData_CBA.CompactLayout();
    MetaData_CBA.RelatedContent rcont = new MetaData_CBA.RelatedContent();
    MetaData_CBA.ArticleTypeTemplate att = new MetaData_CBA.ArticleTypeTemplate();
    MetaData_CBA.LayoutSectionTranslation lst = new MetaData_CBA.LayoutSectionTranslation();
    MetaData_CBA.upsertMetadataResponse_element umre = new MetaData_CBA.upsertMetadataResponse_element();
    MetaData_CBA.SubtabComponents sc = new MetaData_CBA.SubtabComponents();
    MetaData_CBA.LookupFilter lf = new MetaData_CBA.LookupFilter();
    MetaData_CBA.LayoutColumn lc = new MetaData_CBA.LayoutColumn();
    MetaData_CBA.Error err = new MetaData_CBA.Error();
    MetaData_CBA.LogInfo li = new MetaData_CBA.LogInfo();
    MetaData_CBA.PlatformActionListItem pali = new MetaData_CBA.PlatformActionListItem();
    MetaData_CBA.CallOptions_element coe = new MetaData_CBA.CallOptions_element();
    MetaData_CBA.ProfileExternalDataSourceAccess pedsa = new MetaData_CBA.ProfileExternalDataSourceAccess();
    MetaData_CBA.DebuggingHeader_element dhe = new MetaData_CBA.DebuggingHeader_element();
    MetaData_CBA.LayoutItem litem = new MetaData_CBA.LayoutItem();
    MetaData_CBA.SharedTo sto = new MetaData_CBA.SharedTo();
    MetaData_CBA.QuickActionLayoutColumn qalc = new MetaData_CBA.QuickActionLayoutColumn();
    MetaData_CBA.RecordTypePicklistValue rtplv = new MetaData_CBA.RecordTypePicklistValue();
    MetaData_CBA.Container ctr = new MetaData_CBA.Container();
    MetaData_CBA.FeedLayout fl = new MetaData_CBA.FeedLayout();
    MetaData_CBA.RelatedList rlist = new MetaData_CBA.RelatedList();
    MetaData_CBA.SummaryLayout sl = new MetaData_CBA.SummaryLayout();
    MetaData_CBA.QuickActionLayout qal = new MetaData_CBA.QuickActionLayout();
    MetaData_CBA.LayoutTranslation ltl = new MetaData_CBA.LayoutTranslation();
    
    MetaData_CBA.FlowElementReferenceOrValue ferv = new MetaData_CBA.FlowElementReferenceOrValue();
    
    MetaData_CBA.FlowWaitEventOutputParameter dweop = new MetaData_CBA.FlowWaitEventOutputParameter();
    MetaData_CBA.UpsertResult ur = new MetaData_CBA.UpsertResult();
    MetaData_CBA.WorkflowFieldUpdate wu = new MetaData_CBA.WorkflowFieldUpdate(); 
    MetaData_CBA.SearchLayouts sl1 = new MetaData_CBA.SearchLayouts();
    MetaData_CBA.DeleteResult dr = new MetaData_CBA.DeleteResult();
    MetaData_CBA.ProfileApplicationVisibility pav = new MetaData_CBA.ProfileApplicationVisibility();
    MetaData_CBA.WorkflowFlowAction wfa = new MetaData_CBA.WorkflowFlowAction();
    MetaData_CBA.AllOrNoneHeader_element ale = new MetaData_CBA.AllOrNoneHeader_element();
    MetaData_CBA.FlowRecordDelete frd = new MetaData_CBA.FlowRecordDelete();
    MetaData_CBA.Layout lo = new MetaData_CBA.Layout();
    MetaData_CBA.FlowWaitEvent fwe = new MetaData_CBA.FlowWaitEvent();
    MetaData_CBA.FlowAssignment fas = new MetaData_CBA.FlowAssignment();
    MetaData_CBA.FlowInputValidationRule fivr = new MetaData_CBA.FlowInputValidationRule();
    MetaData_CBA.FlowScreenField fsf = new MetaData_CBA.FlowScreenField();
    MetaData_CBA.FeedLayoutFilter flf = new MetaData_CBA.FeedLayoutFilter();
    MetaData_CBA.ActionOverride ao = new MetaData_CBA.ActionOverride();
    MetaData_CBA.WorkflowTask wft = new MetaData_CBA.WorkflowTask();
    MetaData_CBA.FlowInputFieldAssignment ffa = new MetaData_CBA.FlowInputFieldAssignment();
    MetaData_CBA.WorkflowActionReference war = new MetaData_CBA.WorkflowActionReference();
    MetaData_CBA.PermissionSetTabSetting pst = new MetaData_CBA.PermissionSetTabSetting();
    MetaData_CBA.PermissionSetUserPermission psp = new MetaData_CBA.PermissionSetUserPermission();
    MetaData_CBA.FlowOutputFieldAssignment foa = new MetaData_CBA.FlowOutputFieldAssignment();
    MetaData_CBA.FlowApexPluginCallOutputParameter fpcp = new MetaData_CBA.FlowApexPluginCallOutputParameter();
    MetaData_CBA.FlowWaitEventInputParameter fwip = new MetaData_CBA.FlowWaitEventInputParameter();
    MetaData_CBA.WorkflowOutboundMessage wfom = new MetaData_CBA.WorkflowOutboundMessage();
    MetaData_CBA.FlowChoiceUserInput fcui = new MetaData_CBA.FlowChoiceUserInput();
    MetaData_CBA.PermissionSetFieldPermissions ppsp = new MetaData_CBA.PermissionSetFieldPermissions();
    MetaData_CBA.FlowDynamicChoiceSet fdcs = new MetaData_CBA.FlowDynamicChoiceSet();
    MetaData_CBA.Flow flow = new MetaData_CBA.Flow();
    MetaData_CBA.FlowActionCallOutputParameter fcop = new  MetaData_CBA.FlowActionCallOutputParameter();
    MetaData_CBA.FlowRecordCreate frcc = new MetaData_CBA.FlowRecordCreate();
    MetaData_CBA.PermissionSetRecordTypeVisibility pssv = new MetaData_CBA.PermissionSetRecordTypeVisibility();
    MetaData_CBA.PermissionSet prms = new MetaData_CBA.PermissionSet();
    
    MetaData_CBA.WorkflowRule WorkflowRule = new  MetaData_CBA.WorkflowRule ();
    MetaData_CBA.FlowRule FlowRule = new  MetaData_CBA.FlowRule ();
    MetaData_CBA.PermissionSetApexClassAccess PermissionSetApexClassAccess  = new  MetaData_CBA.PermissionSetApexClassAccess ();
    MetaData_CBA.FlowSubflowOutputAssignment FlowSubflowOutputAssignment = new  MetaData_CBA.FlowSubflowOutputAssignment ();
    MetaData_CBA.ProfileTabVisibility ProfileTabVisibility = new  MetaData_CBA.ProfileTabVisibility ();
    MetaData_CBA.FlowLoop FlowLoop = new  MetaData_CBA.FlowLoop ();
    MetaData_CBA.FlowStep FlowStep = new  MetaData_CBA.FlowStep ();
    MetaData_CBA.FlowVariable FlowVariable = new  MetaData_CBA.FlowVariable ();
    MetaData_CBA.WorkflowFlowActionParameter WorkflowFlowActionParameter = new  MetaData_CBA.WorkflowFlowActionParameter ();
    MetaData_CBA.FlowAssignmentItem FlowAssignmentItem = new  MetaData_CBA.FlowAssignmentItem ();
    MetaData_CBA.Workflow Workflow = new  MetaData_CBA.Workflow ();
    MetaData_CBA.WorkflowKnowledgePublish WorkflowKnowledgePublish = new  MetaData_CBA.WorkflowKnowledgePublish ();
    MetaData_CBA.PermissionSetApexPageAccess PermissionSetApexPageAccess = new  MetaData_CBA.PermissionSetApexPageAccess ();
    MetaData_CBA.FlowChoice FlowChoice = new  MetaData_CBA.FlowChoice ();
    MetaData_CBA.PermissionSetExternalDataSourceAccess PermissionSetExternalDataSourceAccess = new  MetaData_CBA.PermissionSetExternalDataSourceAccess ();
    MetaData_CBA.FlowConnector FlowConnector = new  MetaData_CBA.FlowConnector ();
    MetaData_CBA.FlowRecordLookup FlowRecordLookup = new  MetaData_CBA.FlowRecordLookup ();
    MetaData_CBA.WorkflowEmailRecipient WorkflowEmailRecipient = new  MetaData_CBA.WorkflowEmailRecipient ();
    MetaData_CBA.FlowApexPluginCall FlowApexPluginCall = new  MetaData_CBA.FlowApexPluginCall ();
    MetaData_CBA.QuickActionList QuickActionList = new  MetaData_CBA.QuickActionList ();
    MetaData_CBA.PrimaryTabComponents PrimaryTabComponents = new  MetaData_CBA.PrimaryTabComponents ();
    MetaData_CBA.QuickActionListItem QuickActionListItem = new  MetaData_CBA.QuickActionListItem ();
    MetaData_CBA.PermissionSetCustomPermissions PermissionSetCustomPermissions = new  MetaData_CBA.PermissionSetCustomPermissions ();
    MetaData_CBA.WorkflowAlert WorkflowAlert = new  MetaData_CBA.WorkflowAlert ();
    MetaData_CBA.FlowTextTemplate FlowTextTemplate = new  MetaData_CBA.FlowTextTemplate ();
    
    MetaData_CBA.FlowScreen FlowScreen = new  MetaData_CBA.FlowScreen ();
    MetaData_CBA.WorkflowSend WorkflowSend = new  MetaData_CBA.WorkflowSend ();
    MetaData_CBA.FlowRecordFilter FlowRecordFilter = new  MetaData_CBA.FlowRecordFilter ();
    MetaData_CBA.FlowActionCall FlowActionCall = new  MetaData_CBA.FlowActionCall ();
    MetaData_CBA.FlowApexPluginCallInputParameter FlowApexPluginCallInputParameter = new  MetaData_CBA.FlowApexPluginCallInputParameter ();
    MetaData_CBA.FlowSubflow FlowSubflow = new  MetaData_CBA.FlowSubflow ();
    MetaData_CBA.AnalyticsCloudComponentLayoutItem AnalyticsCloudComponentLayoutItem = new  MetaData_CBA.AnalyticsCloudComponentLayoutItem ();
    MetaData_CBA.SharingReason SharingReason = new  MetaData_CBA.SharingReason ();
    MetaData_CBA.FlowDecision FlowDecision = new  MetaData_CBA.FlowDecision ();
    MetaData_CBA.ProfileRecordTypeVisibility ProfileRecordTypeVisibility = new  MetaData_CBA.ProfileRecordTypeVisibility ();
    MetaData_CBA.ProfileApexPageAccess ProfileApexPageAccess = new  MetaData_CBA.ProfileApexPageAccess ();
    MetaData_CBA.LayoutSection LayoutSection = new  MetaData_CBA.LayoutSection ();
    MetaData_CBA.FlowMetadataValue FlowMetadataValue = new  MetaData_CBA.FlowMetadataValue ();
    MetaData_CBA.ProfileObjectPermissions ProfileObjectPermissions = new  MetaData_CBA.ProfileObjectPermissions ();
    MetaData_CBA.PermissionSetObjectPermissions PermissionSetObjectPermissions = new  MetaData_CBA.PermissionSetObjectPermissions ();
    MetaData_CBA.ProfileApexClassAccess ProfileApexClassAccess = new  MetaData_CBA.ProfileApexClassAccess ();
    MetaData_CBA.ProfileLoginIpRange ProfileLoginIpRange = new  MetaData_CBA.ProfileLoginIpRange ();
    MetaData_CBA.FlowWait FlowWait = new  MetaData_CBA.FlowWait ();
    MetaData_CBA.FeedLayoutComponent FeedLayoutComponent = new  MetaData_CBA.FeedLayoutComponent ();
    MetaData_CBA.FlowCondition FlowCondition = new  MetaData_CBA.FlowCondition ();
    MetaData_CBA.deleteMetadataResponse_element deleteMetadataResponse_element = new  MetaData_CBA.deleteMetadataResponse_element ();
    MetaData_CBA.PermissionSetApplicationVisibility PermissionSetApplicationVisibility = new  MetaData_CBA.PermissionSetApplicationVisibility ();
    MetaData_CBA.FlowSubflowInputAssignment FlowSubflowInputAssignment = new  MetaData_CBA.FlowSubflowInputAssignment ();
    MetaData_CBA.HistoryRetentionPolicy HistoryRetentionPolicy = new  MetaData_CBA.HistoryRetentionPolicy ();
    MetaData_CBA.FlowFormula FlowFormula = new  MetaData_CBA.FlowFormula ();
    MetaData_CBA.WorkflowTimeTrigger WorkflowTimeTrigger = new  MetaData_CBA.WorkflowTimeTrigger ();
    
    
    
    System.assertNotEquals(null,minilayout1);
}
}