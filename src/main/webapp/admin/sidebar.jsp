			<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse bg-white"
                style="overflow-y: auto;">
                <div class="position-sticky pt-3">
                    <ul class="nav flex-column sidebar-content fs-6">
                        <li class="nav-item">
                            <!-- active -->
                            <a class="nav-link" aria-current="page" href="admin/index.jsp" id="dashboard-collapse">
                                <i class="bi bi-house-door"></i>
                                Dashboard
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link collapsed" data-bs-toggle="collapse" data-bs-target="#customers-collapse"
                                aria-expanded="false" style="cursor: pointer;">
                                <i class="bi bi-people"></i>
                                Manager
                                <div class="sidebar-arrow">                                   
                                    <i class="bi bi-chevron-right"></i>
                                    <i class="bi bi-chevron-down"></i>
                                </div>
                            </a>
                            <div class="collapse" id="customers-collapse">
                                <ul class="list-unstyled fw-normal pb-1 small">
                                    <li>
                                        <a href="/xskt/ListAccount" class="m-5 text-decoration-none text-dark" id="customers-collapse1">Account table</a>
                                    </li>
                                    <li>
                                        <a href="/xskt/AddAccount" class="m-5 text-decoration-none text-dark" id="customers-collapse2">Add account</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link collapsed" data-bs-toggle="collapse"
                                data-bs-target="#customData-collapse" aria-expanded="false" style="cursor: pointer;">
                                <i class="bi bi-clipboard-data"></i>
                                Custom data
                                <div class="sidebar-arrow">                                   
                                    <i class="bi bi-chevron-right"></i>
                                    <i class="bi bi-chevron-down"></i>
                                </div>
                            </a>
                            <!-- class="show": show ul -->
                            <div class="collapse" id="customData-collapse">
                                <ul class="list-unstyled fw-normal pb-1 small">
                                    <li><a href="/xskt/ListLottery" class="m-5 text-decoration-none text-dark" id="customData-collapse1">Data table</a></li>
                                    <li><a href="/xskt/AddLottery" class="m-5 text-decoration-none text-dark" id="customData-collapse2">Add data</a></li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>