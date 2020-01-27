mvc.Components.get('tblCrashReport').getVisualization(function(tableView) { tableView.table.addCellRenderer(new CustomTooltipRenderer());
	tableView.table.render();
});
