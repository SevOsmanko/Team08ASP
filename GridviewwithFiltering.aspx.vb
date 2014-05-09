Partial Class GridviewwithFiltering
    Inherits System.Web.UI.Page

    Protected Sub ModuleCode_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        ModuleCode.SelectedIndex = ModuleTitle.SelectedIndex
    End Sub

    Protected Sub ModuleTitle_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        ModuleTitle.SelectedIndex = ModuleCode.SelectedIndex
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

End Class